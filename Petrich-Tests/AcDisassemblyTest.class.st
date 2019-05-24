Class {
	#name : #AcDisassemblyTest,
	#superclass : #TestCase,
	#category : 'Petrich-Tests'
}

{ #category : #powerpc }
AcDisassemblyTest >> testPowerAdd [
	| instr |
	instr := AcProcessorDescriptions powerpc disassemble: 16r62830001.   "ori 3, 20, 0x1"
	self assert: (instr isKindOf: GroundedProcessorInstruction).
	self assert: instr name equals: 'ori'.
]

{ #category : #powerpc }
AcDisassemblyTest >> testPowerLbz [
	"LBZ D-form (PPCArch, p.50):
	 lbz r2, 0x0001(r7).
	Test back and forth, i.e. assemble and then disassemble."

	| pdl lbz env grounded binary |
	pdl := AcProcessorDescriptions powerpc.
	lbz := pdl instructionAt: #lbz.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: 1;
		yourself.
	grounded := lbz bind: env.
	binary := grounded emit32.
	self assert: grounded equals: (pdl disassemble: binary).
]

{ #category : #'riscv-r32i' }
AcDisassemblyTest >> testR32iRadd [
	| instr |
	instr := AcProcessorDescriptions riscv disassemble: 16rA2002001. "%l1 := 1"
	self assert: (instr isKindOf: GroundedProcessorInstruction).
	self assert: instr name equals: 'add_imm'.
	self assert: (instr externalBindings at: 'rs1') equals: 0.
	self assert: (instr externalBindings at: 'rd')  equals: 17.
	self assert: (instr externalBindings at: 'simm13') equals: 1.
]

{ #category : #sparc }
AcDisassemblyTest >> testSparcAdd [
	| instr |
	instr := AcProcessorDescriptions sparcv8 disassemble: 16rA2002001. "%l1 := 1"
	self assert: (instr isKindOf: GroundedProcessorInstruction).
	self assert: instr name equals: 'add_imm'.
	self assert: (instr externalBindings at: 'rs1') equals: 0.
	self assert: (instr externalBindings at: 'rd')  equals: 17.
	self assert: (instr externalBindings at: 'simm13') equals: 1.
]

{ #category : #sparc }
AcDisassemblyTest >> testSparcNop [
	| instr |
	instr := AcProcessorDescriptions sparcv8 disassemble: 16r01000000.
	self assert: (instr isKindOf: GroundedProcessorInstruction).
	self assert: instr name equals: 'nop'.
]
