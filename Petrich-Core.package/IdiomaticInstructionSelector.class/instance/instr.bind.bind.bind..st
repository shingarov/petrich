block convenience
instr: anInstructionNameSymbol bind: op1 bind: op2 bind: op3
	^self instr: anInstructionNameSymbol	bindAll: (Array with: op1 with: op2 with: op3)