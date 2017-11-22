as yet unclassified
testPopR
	"Assume that RR is R2."
	| gdb instructions regs mem |
	self halt.
	instructions := self nativizePopR.
	gdb := (RemoteGDB
		host: '192.168.56.101'
		port: 9123
		processorDescription: self pdl).

	regs := gdb getRegisters.
	mem := gdb read32At: (regs at:'r25'). "the value we are popping"
	gdb writeInt32s: instructions toAddr: (regs at: 'pc').
	gdb s.
	gdb s.
	regs := gdb getRegisters.
	self assert: mem = (regs at: 'r2')