engine
setVRegister: r to: x
	| nRegister |
	nRegister := TAJWriter vRegister:  r.
	nRegister := 'r', nRegister printString.
	self setRegister: nRegister to: x