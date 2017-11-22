logic
printConditionsOn: aStream instruction: instr
	aStream 
		nextPutAll: '  is_';
		nextPutAll: type;
		nextPutAll: '(Op';
		nextPutAll: (number printString);
		nextPutAll: '),';
		cr