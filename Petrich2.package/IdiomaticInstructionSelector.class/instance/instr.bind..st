block convenience
instr: anInstructionNameSymbol bind: op1
	^self instr: anInstructionNameSymbol	bindAll: (Array with: op1)