logic - private
printEmitGoalOn: aStream
	aStream nextPutAll: 'emit(AST, Instructions) :-';
	lf; nextPutAll: '   e(AST, AbstractInstructions),';
	lf; nextPutAll: '   all_gprs(AbstractInstructions,GPRs),';
	"1,2,3,4,5,16,17,18,29 reserved on PPC-MT"
	lf; nextPutAll: '   removeAll(GPRs,[6,7,8,9,10,11,12,13,14,15,19,20,21,22,23,24,25,26,27,28,30,31], Available),';
	lf; nextPutAll: '   select_reg(AbstractInstructions, Available, [], Instructions1, _, _),';
	lf; nextPutAll: '   flatten(Instructions1, Instructions).'; lf; lf