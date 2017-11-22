logic
printLogicOn: aStream
	term printRewriteHeadOn: aStream.
	aStream nextPutAll: ' => ';
		nextPutAll: instruction name;
		nextPut: $(.
	self printOperandNumbersOn: aStream.
	aStream
		nextPut: $);
		nextPutAll: ' :-';
		lf.
	self printLetOn: aStream.
	term printConditionsOn: aStream instruction: instruction.
	aStream nextPutAll: '  true.'