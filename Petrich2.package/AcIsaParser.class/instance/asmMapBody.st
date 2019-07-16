grammar
asmMapBody
	"There are 4 forms of asmMapBody:
	(1)  STR symbolList = i; // AcAsmMapBodyIds
	(2)  STR[i..i] = [i..i]; // AcAsmMapBodyIdRange
	(3)  [i..i]STR = [i..i]; // AcAsmMapBodyRangeId
	(4)  STR[i..i]STR = [i..i];  (I haven't seen any model use this last one).
	"
	^asmMapBody1 / asmMapBody2