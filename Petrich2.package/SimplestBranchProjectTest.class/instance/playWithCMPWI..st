tests
playWithCMPWI: inst
	self assert: inst @'address' equals: startAddr.
	self assert: inst @'bytes' equals: #[44 1 0 0].
	self assert: inst @'mnemonic' equals: 'cmpwi'.
	self assert: inst insn_name equals: 'cmpwi'.
	"NB: the most interesting stuff, like regs_access(),
	is not supported on the PPC"