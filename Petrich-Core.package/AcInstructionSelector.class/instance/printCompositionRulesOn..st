logic - private
printCompositionRulesOn: aStream
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