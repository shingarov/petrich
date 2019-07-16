grammar
compileBlock: sourceString
	^OpalCompiler new
		class: self class;
		receiver: instructionSelector;
		source: sourceString;
		evaluate 