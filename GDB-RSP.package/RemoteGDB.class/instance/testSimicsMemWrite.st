tests
testSimicsMemWrite
	" (RemoteGDB
		host: '192.168.1.128'
		port: 9123
		processorDescription: AcProcessorDescriptions powerpc)
		testSimicsMemWrite
	"
	| regs pc instr answer |
	self halt.
	regs := self getRegisters.
	pc := regs at: 'pc'.
	
	instr := AcProcessorDescriptions powerpc  
		emit: 'transfer(gpr(2), 500000)'.


self writeInt32s: instr toAddr: pc.


	answer := self read32At: pc.
	self s.
	regs := self getRegisters.
	self s.
	self s.
	self s.
	
	