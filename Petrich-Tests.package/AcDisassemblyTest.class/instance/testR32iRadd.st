riscv-r32i
testR32iRadd
	| instr |
	instr := AcProcessorDescriptions riscv disassemble: 16rA2002001. "%l1 := 1"
	self assert: (instr isKindOf: GroundedProcessorInstruction).
	self assert: instr name equals: 'add_imm'.
	self assert: (instr externalBindings at: 'rs1') equals: 0.
	self assert: (instr externalBindings at: 'rd')  equals: 17.
	self assert: (instr externalBindings at: 'simm13') equals: 1.