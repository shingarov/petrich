initialization
executeStartChain
	| regs |
	regs := gdb s; "the first nop"
		s; s; "lis/ori 16"
		s; s;
		s; s;
		s; s; "2 nops"
		getRegisters.
		
	TAJWriter initializeRegisterMap.
	nZone := regs at: (self regNameFor: #NZone).
	heap := regs at: (self regNameFor: #HEAP).
	stack := regs at: (self regNameFor: #SP).