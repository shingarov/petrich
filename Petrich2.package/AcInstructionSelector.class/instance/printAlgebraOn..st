logic - private
printAlgebraOn: aStream
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