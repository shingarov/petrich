representation
setVRegister: r to: x
	| nRegister |
	nRegister := TAJWriter vRegister: r.
	self setRegister: nRegister to: x