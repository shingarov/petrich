tests
testSPARCv8
	| regs pc newPC instr |
self halt.
	regs := self getRegisters.

	pc := regs at: 'pc'.
	instr := (processorDescription instructionAt: #ori) bind: (Dictionary new 
		at: 'rs' put: 3;
		at: 'rt' put: 3;
		at: 'imm' put: 25;
		yourself).
	instr := Array with: instr emit.
	self writeInt32s: instr toAddr: pc.
	self writeInt32s: instr toAddr: pc+4.
	self writeInt32s: instr toAddr: pc+8.
	instr := processorDescription disassemble: (self read32At: pc).
	self halt.
	self s.
	regs := self getRegisters.
	self s.
	regs := self getRegisters.
	newPC := regs at: 'pc'.
	newPC == (pc+4) ifFalse: [ self error ].
	instr := processorDescription disassemble: (self read32At: newPC).
	instr name = 'ori' ifFalse: [ self error ]
		
	
	