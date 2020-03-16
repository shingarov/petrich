tests
playWithCapstone: aCapstoneBlock
	| insns |
	self assert: aCapstoneBlock @'addr' equals: startAddr.
	self assert: aCapstoneBlock @'arch' @'name' equals: 'PPC32'.
	self deny: aCapstoneBlock @'thumb'.
	insns := aCapstoneBlock @'insns'.
	
	self playWithCMPWI: insns first @'insn'. "some kind of wrapping around CsInsn"
	self playWithBNE: insns second @'insn'.
	