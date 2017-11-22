binary emission
emitIdiom: idiomName with: op1 with: op2 with: op3 with: op4 with: op5

	^self assembleBinary: ((invS at: idiomName)
		valueWithArguments: (Array with: op1 with: op2 with: op3 with: op4 with: op5))