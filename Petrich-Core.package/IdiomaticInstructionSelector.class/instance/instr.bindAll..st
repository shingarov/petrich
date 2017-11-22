block convenience
instr: anInstructionNameSymbol bindAll: ops
	^(self pdl instructionAt: anInstructionNameSymbol)
		bindSequence: ops