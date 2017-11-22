as yet unclassified
testPushRT
	| gdb instructions regs mem const |
	const := 16r12345678.
	self halt.
	instructions := self nativizePushR.
	gdb := (RemoteGDBSession
		host: '192.168.56.101'
		port: 9123
		processorDescription: self pdl).

	regs := gdb getRegisters.
	regs at: 'r2' put: const.
	gdb setRegisters: regs.
	gdb writeInt32s: instructions toAddr: (regs at: 'pc').
	gdb s.
	gdb s.
	gdb s.
	regs := gdb getRegisters.
	mem := gdb read32At: (regs at:'r25').
	self assert: mem = const
