binary emission
emitIdiom: idiomName withOperands: operands
	^self assembleBinary: ((invS at: idiomName) valueWithArguments: operands)