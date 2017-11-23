representation
getVRegister: r
	| nRegister |
	nRegister := TAJWriter vRegister: r.
	^self getRegisters at: 'r', nRegister printString