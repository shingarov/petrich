sparc
testSparcAdd
	| instr |
	instr := AcProcessorDescriptions sparcv8 disassemble: 16rA2002001. "%l1 := 1"
	self assert: instr name equals: 'add_imm'.
	self assert: (instr fieldValue: 'rs1') equals: 0.
	self assert: (instr fieldValue: 'rd')  equals: 17.
	self assert: (instr fieldValue: 'simm13') equals: 1.