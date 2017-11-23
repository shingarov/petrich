surgery
return
	| cm numToDrop |
	self halt.
	cm := MTRemoteCompiledMethod gdb: self pointer: (self getVRegister: #X).
	numToDrop := cm numArgs - 1 max: 0.
	numToDrop = 0 ifFalse: [ self setVRegister: #SP to: (self getVRegister: #SP) - (numToDrop * 4) ]
