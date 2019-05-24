Class {
	#name : #InstructionFormatTest,
	#superclass : #TestCase,
	#category : 'Petrich-Tests'
}

{ #category : #powerpc }
InstructionFormatTest >> testAddisEncoding [
	"addis D-form (PPCArch, p.82):
	 addis r2, r7, 0x1 "

	| addis env grounded |
	addis := AcProcessorDescriptions powerpc instructionAt: #addis.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: 1;
		yourself.
	grounded := addis bind: env.
	"001111 00010 00111 0000000000000001"
	self assert: grounded emit equals: '00111100010001110000000000000001'
]

{ #category : #powerpc }
InstructionFormatTest >> testCmpEncoding [
	"Compare X-form (PPCArch, p.99):
	 cmp 1,r31,r0 "
	| cmp inst env |
	cmp := AcProcessorDescriptions powerpc instructionAt: #cmp.
	env := Dictionary new
		at: #bf put: 1;
		at: #l  put: 0; "Even L=0 always, the PDL leaves it variable in set_decoder"
		at: #ra put: 31;
		at: #rb put: 0;
		yourself.
	inst := cmp bind: env.
	self assert: inst emit32 equals: 16r7C9F0000
]

{ #category : #powerpc }
InstructionFormatTest >> testFormatEmission [
	| f x4 |
	f := AcProcessorDescriptions powerpc instructionFormats.
	x4 := f at: #X4.
	self assert: x4 emit equals: '###############################0'
]

{ #category : #mips }
InstructionFormatTest >> testJrEncoding [
	" jr r3
	See MIPS Run, 1st Ed., p.217 et seq. "
	| mips jr inst env |
	mips := AcProcessorDescriptions mips.
	jr := mips instructionAt: #jr.
	env := Dictionary new
		at: #rd put: 0;  " unused, must be 0 "
		at: #rt put: 0;  " unused, must be 0 "
		at: #shamt put: 0;  " unused, must be 0 "
		at: #rs put: 3;
		yourself.
	inst := jr bind: env.
	self assert: inst emit32 = 16r00600008
]

{ #category : #powerpc }
InstructionFormatTest >> testLbzEncoding [
	"LBZ D-form (PPCArch, p.50):
	 lbz r2, 0x0001(r7) "

	| lbz env grounded |
	lbz := AcProcessorDescriptions powerpc instructionAt: #lbz.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: 1;
		yourself.
	grounded := lbz bind: env.
	self assert: grounded emit32 equals: 16r88470001
]

{ #category : #powerpc }
InstructionFormatTest >> testLbzEncodingNegativeOffset [
	"LBZ D-form (PPCArch, p.50):
	 lbz r2, -1(r7) "

	| lbz env grounded |
	lbz := AcProcessorDescriptions powerpc instructionAt: #lbz.
	env := Dictionary new
		at: #rt put: 2;
		at: #ra put: 7;
		at: #d put: -1;
		yourself.
	grounded := lbz bind: env.
	self assert: grounded emit32 equals: 16r8847FFFF
]

{ #category : #powerpc }
InstructionFormatTest >> testMcrf [
	"Some instruction formats, e.g. XL3 on the PowerPC,
	 include constant bitfields.
	 MCRF (PPCArch, p.46) is an example of XL3-encoded instruction:
	 opcd:6 = 2r01011;
	 bf:3;
	 0:2;
	 bfa:3;
	 0:2;
	 0:5;
	 xog:10 = 0;
	 0:1.
	 Some of these constants can appear more than once at different widths --
	 see '0:2' and '0:1' here.
	 "
	| instruction operands binary |
	instruction := AcProcessorDescriptions powerpc instructionAt: #mcrf.
	operands := Dictionary new
		at: 'bf' put: 1;
		at: 'bfa' put: 3;
		yourself.
	instruction := instruction bind: operands.
	binary := instruction emit. " 010011 001 00 011 00 00000 0000000000 0 "
	self assert: binary equals: '01001100100011000000000000000000'
]

{ #category : #x86 }
InstructionFormatTest >> testNOP [
	| nop binary |
	nop := AcProcessorDescriptions x86 instructionAt: #nop.
	binary := nop emit. "0x90"
	self assert: binary equals: '10010000'
]

{ #category : #powerpc }
InstructionFormatTest >> testNegativeOffset [

	| stw operands binary |
	stw := AcProcessorDescriptions powerpc instructionAt: #stw.
	operands := Dictionary new
		at: 'rs' put: 1;
		at: 'ra' put: 3;
		at: 'd' put: -1;
		yourself.
	stw := stw bind: operands.
	binary := stw emit. " 1001000000100011 0000000000000000 "
	self assert: binary equals: '10010000001000111111111111111111'
]

{ #category : #'riscv-r32i' }
InstructionFormatTest >> testRISCVadd [
	| add operands binary |
	add := AcProcessorDescriptions riscv instructionAt: #ADD.
	operands := Dictionary new
		at: 'rs1' put: 1;
		at: 'rs2' put: 2;
		at: 'rd'  put: 3;
		yourself.
	add := add bind: operands.
	binary := add emit. "0000000,00010,00001,000,00011,0110011"
	self assert: binary equals: '00000000001000001000000110110011'
]

{ #category : #mips }
InstructionFormatTest >> testSllEncoding [
	" sll r1, r2, 2
	See MIPS Run, 1st Ed., p.217 et seq. "
	| mips sll inst env |
	mips := AcProcessorDescriptions mips.
	sll := mips instructionAt: #sll.
	env := Dictionary new
		at: #rd put: 1;
		at: #rt put: 2;
		at: #shamt put: 2;
		at: #rs put: 0;  "Unused and must be set to 0"
		yourself.
	inst := sll bind: env.
	self assert: inst emit32 = 16r00020880
]
