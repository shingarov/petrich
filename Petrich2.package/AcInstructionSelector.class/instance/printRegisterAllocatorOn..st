logic - private
printRegisterAllocatorOn: aStream
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
