binary emission
emitIdiom: idiomName with: op1 with: op2
	^self assembleBinary: ((invS at: idiomName) value: op1 value: op2)