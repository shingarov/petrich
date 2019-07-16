logic - private
printUtilityFunctionsOn: aStream

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