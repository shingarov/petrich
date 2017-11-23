tests
testSimics1
	| regs pc newPC instr |
	regs := self getRegisters.
	pc := regs at: 'pc'.
	self s.
	regs := self getRegisters.
	newPC := regs at: 'pc'.
	newPC == (pc+4) ifFalse: [ self error ].
	instr := processorDescription disassemble: (self read32At: newPC).
	instr name = 'addis' ifFalse: [ self error ]
		
	
	