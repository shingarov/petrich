engine
getVRegister: regSym
	| nRegister |
	nRegister := TAJWriter vRegister: regSym.
	^self getRegister: 'r', nRegister printString