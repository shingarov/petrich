grammar
instruction
	^instructionName, operands ==> [ :x |
		| instructionDefinition  operandValues |
		instructionDefinition := processorDescription instructionAt: x first asSymbol.
		operandValues := x second.
		instructionDefinition bindSequence: operandValues ]