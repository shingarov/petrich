binary emission
emitIdiom: idiomName with: op1
	^self assembleBinary: ((invS at: idiomName) value: op1)