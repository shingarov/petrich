surgery
call
	| methodDef cmRef regs |
	methodDef := gdb currentBytecode method value.
	regs := gdb getRegisters.
	regs at: 'ctr' put: (gdb exe externalReferences at: methodDef codeRuntimeName).
	cmRef := gdb exe externalReferences at: methodDef globalName.
	regs at: (TAJWriter registerMap at: #X) put: cmRef.
	gdb setRegisters: regs.
	gdb s