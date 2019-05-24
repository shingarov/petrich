Class {
	#name : #AcInstructionSelector,
	#superclass : #AcProcessorDescription,
	#instVars : [
		'iis'
	],
	#category : 'Petrich-Core'
}

{ #category : #'code emitting' }
AcInstructionSelector >> assembleBinary: x [

]

{ #category : #'code emitting' }
AcInstructionSelector >> emit: anAbstractTerm [
	| f result emittedInstructions |
self halt.
	[FileSystem disk delete: SWIProlog pigCanDigFileName] on: FileDoesNotExist do: [  ].
	f := FileStream newFileNamed: SWIProlog pigCanDigFileName.
	self printLogicOn: f.
	self printGoGoal: anAbstractTerm on: f.
	f close.
	result := SWIProlog new emit.
	emittedInstructions := (RewriteResultParser pdl: self) parse: result.
	^self assembleBinary: emittedInstructions
]

{ #category : #accessing }
AcInstructionSelector >> iis [
	iis isNil ifTrue: [ iis := IdiomaticInstructionSelector pdl: self ].
	^ iis
]

{ #category : #accessing }
AcInstructionSelector >> iis: anObject [
	iis := anObject
]

{ #category : #'logic - private' }
AcInstructionSelector >> printAlgebraOn: aStream [
	aStream
		lf; nextPutAll: '/* ALGEBRA */';
		lf; nextPutAll: '/* abstract shift */
transfer(Rd, (V << S)) => [X,Y] :-
                integer(V), is_GPR(Rd), is_GPR(Rtmp),
                        e(transfer(Rtmp,V), X), e(transfer(Rd,shl(Rtmp,S)),Y).

transfer(R,S) => transfer(R,+(S,0)) :- is_GPR(R), is_GPR(S).

/* abstract or */
transfer(Rd, Ximm \/ Yimm) => [X,Y,Z] :-
        integer(Ximm), integer(Yimm),
        is_GPR(Rd), is_GPR(R1), is_GPR(R2),
        e(transfer(R1,Ximm),X), e(transfer(R2,Yimm),Y), e(transfer(Rd,or(R1,R2)),Z).
/* Integer decomposition */
transfer(R,Imm) => transfer(R,(Hi << 16)) :- integer(Imm), (Imm/\65535) =:= 0, Hi is (Imm >> 16). /* easy degenerate case, Lo==0 */
transfer(R,Imm) => transfer(R, Hi \/ Lo) :- integer(Imm), Hi is (Imm /\ 0xFFFF0000), Lo is (Imm /\ 0xFFFF).

' copyReplacingCRtoLF 
]

{ #category : #'logic - private' }
AcInstructionSelector >> printCompositionRulesOn: aStream [
	aStream
	lf; nextPutAll: '/* we ran out of primitive transfers, try composite */';
	lf; nextPutAll: 'transfer(A,C) => [Y,X] :- is_GPR(B), e(transfer(A,B), X), e(transfer(B,C), Y).';
	lf;
	lf; nextPutAll: '/* See if arg is grounded to a concrete or temp GPR.
   Fail if arg is not fully grounded. */
bound_GPR(gpr(N)) :- integer(N), memberchk(N, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]).
bound_GPR(tmp_gpr(N)) :- integer(N).

/* Succeed if the arg is bound to a concrete or temp GPR.
   If unbound, get a new temp GPR. */
is_GPR(R) :- bound_GPR(R), !.
is_GPR(tmp_gpr(X)) :- new_int(X).


' copyReplacingCRtoLF 
]

{ #category : #'logic - private' }
AcInstructionSelector >> printEmitGoalOn: aStream [
	aStream nextPutAll: 'emit(AST, Instructions) :-';
	lf; nextPutAll: '   e(AST, AbstractInstructions),';
	lf; nextPutAll: '   all_gprs(AbstractInstructions,GPRs),';
	"1,2,3,4,5,16,17,18,29 reserved on PPC-MT"
	lf; nextPutAll: '   removeAll(GPRs,[6,7,8,9,10,11,12,13,14,15,19,20,21,22,23,24,25,26,27,28,30,31], Available),';
	lf; nextPutAll: '   select_reg(AbstractInstructions, Available, [], Instructions1, _, _),';
	lf; nextPutAll: '   flatten(Instructions1, Instructions).'; lf; lf
]

{ #category : #'logic - private' }
AcInstructionSelector >> printEquivalenceTheoryOn: aStream [
	aStream nextPutAll:
'/* Equivalence theory */
:- op(500, xfx, =>).
e(X,Y) :- e2(X,Y).
e2(X,Z) :- e1(X,Y), e2(Y,Z).
e2(X,X).

/* Substitutivity: */
e1(transfer(A1,B), transfer(A2,B)) :- e1(A1,A2).
e1(transfer(A,B1), transfer(A,B2)) :- e1(B1,B2).

/* Rewrite Axiom */
e1(X,Y) :- (X => Y).


' copyReplacingCRtoLF 
]

{ #category : #'logic - private' }
AcInstructionSelector >> printGoGoal: anAbstractTerm on: aStream [
	aStream nextPutAll: 'go :- Abstract = ';
	nextPutAll: anAbstractTerm;
	nextPutAll: ',
emit(Abstract, X),
print(X).
' copyReplacingCRtoLF 
]

{ #category : #'logic - private' }
AcInstructionSelector >> printInstructionRewriteRulesOn: aStream [
	aStream nextPutAll: '/* INSTRUCTION REWRITING RULES: */'; lf; lf.
	instructions do: [ :instr | instr printLogicOn: aStream ].
		aStream nextPutAll: '/* END OF INSTRUCTION REWRITING RULES */'; lf; lf.

]

{ #category : #logic }
AcInstructionSelector >> printLogicOn: aStream [
	self
		printEmitGoalOn: aStream;
		printRegisterAllocatorOn: aStream;
		printUtilityFunctionsOn: aStream;
		printEquivalenceTheoryOn: aStream;
		printInstructionRewriteRulesOn: aStream;
		printAlgebraOn: aStream;
		printCompositionRulesOn: aStream 
]

{ #category : #'logic - private' }
AcInstructionSelector >> printRegisterAllocatorOn: aStream [
	"This needs to be rewritten from the trivial greedy allocation
	to Chaitin graph coloring (in '20 Years of PLDI', ACM, 2003).
	See also: Bradlee, Eggers, Henry: Integrating Register Allocation
	and Instruction Scheduling for RISCs (ACM, 1991)."
	aStream nextPutAll:
'/* Concretize one GPR: select_reg(AbstractR, Available, Bound,
              ConcreteR, StillAvailable, NewBound)  */
select_reg(gpr(N), Avail, Bound,
           gpr(N), StillAvail, Bound) :-
                   remove(N, Avail, StillAvail), !. /* R already concrete */
select_reg(tmp_gpr(T), Avail, Bound, /* T already concretized to be G */
           gpr(G), Avail, Bound) :- memberchk([T|G],Bound), !.
select_reg(tmp_gpr(T), [G|StillAvail], Bound, /* Take one available GPR */
           gpr(G), StillAvail, [[T|G] | Bound]) :- !.
/* No more scratch registers; don''t know how to spill */
select_reg(tmp_gpr(_),_,_,_,_,_) :- !, fail.

/* Lists */
select_reg([], A, B, [], A, B) :- !.
select_reg([AH|AT], Available, Bound,
           [CH|CT], StillAvailable, NewBound) :-
                   select_reg(AH, Available, Bound,
                              CH, TmpAvailable, TmpBound),
                   select_reg(AT, TmpAvailable, TmpBound,
                              CT, StillAvailable, NewBound), !.

/* Terms */
select_reg(AbstractTerm, Available, Bound,
           ConcreteTerm, StillAvailable, NewBound) :-
                   AbstractTerm =.. [F|AbstractArgs],
                   select_reg(AbstractArgs, Available, Bound,
                              ConcreteArgs, StillAvailable, NewBound),
                   ConcreteTerm =.. [F|ConcreteArgs], !.

/* Everything else is rewritten verbatim */
select_reg(A, Available, Bound, A, Available, Bound).



/* List L of all concrete GPRs in expression E */
all_gprs([],[]) :-!.
all_gprs(gpr(N),N) :-!.
all_gprs([H|T], X) :- /* HG is list */
        all_gprs(H,HG),
        all_gprs(T,TG),
        concat(HG,TG,X), !.
all_gprs([H|T], [HG|TG]) :- /* HG is not list */
        all_gprs(H,HG),
        all_gprs(T,TG), !.
all_gprs(T,L) :-
        T =.. [_|Args],
        all_gprs(Args,L), !.

' copyReplacingCRtoLF 

]

{ #category : #'logic - private' }
AcInstructionSelector >> printUtilityFunctionsOn: aStream [

	aStream nextPutAll:
'/*******************************************************
 * General utility functions                           *
 *******************************************************/

concat([],B,B).
concat([H|T],B,[H|TB]) :- concat(T,B,TB).
/* flatten(List,FlattenedList) */
flatten([],[]).
flatten([[]|L],F) :- flatten(L,F), !. /* amputate empty head */
flatten([[X|Y]|T],F) :- /* head is a list */
    concat(Y,T,Z),
    flatten([X|Z],F), !.
flatten([X|T],[X|FT]) :- flatten(T,FT).
/* If all else fails, X is not a list.
 * Without the following clause, the allocator will insist
 * on more than one instruction. */
flatten(X,[X]).

current_int(_) :- fail.
new_int(I) :- current_int(I), J is I+1, abolish(current_int/1), assert(current_int(J)), !.
new_int(I) :- I=1, abolish(current_int/1), assert(current_int(2)).


/* Test if S is subterm of T; used for allocating distinct registers */
subterm(T,T).
subterm(S,T) :- compound(T), T =.. [S|_].   /* S is functor of T */
subterm(S,T) :- compound(T), T =.. [_|Args], subterm_list(S,Args).
subterm_list(S,[Arg|_]) :- subterm(S,Arg).
subterm_list(S,[_|Args]) :- subterm_list(S,Args).

leaves([T|nil],T) :- atom(T).

/* remove Arg1 from Arg2, producing Arg3 */
remove(_, [], []).
remove(X, [X|L], M) :- remove(X, L, M), !.
remove(X, [Y|L], [Y|Z]) :- remove(X, L, Z).

/* removeAll(All, In, Out) */
removeAll([],X,X).
removeAll([X|R],In,Out) :- remove(X,In,T), removeAll(R,T,Out).
' copyReplacingCRtoLF 
]
