control primitives
primValue
	| addr |
	addr := (MTRemoteBlockClosure gdb: gdb pointer: self receiverOop)
		compiledBlock codeRef address.
	self setVRegister: #Scratch1 to: addr.
	self setVRegister: #X to: self receiverOop.
	self markSuccess 