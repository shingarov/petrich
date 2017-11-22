block convenience
instr: anInstructionNameSymbol bind: op1 bind: op2
	^self instr: anInstructionNameSymbol	bindAll: (Array with: op1 with: op2)