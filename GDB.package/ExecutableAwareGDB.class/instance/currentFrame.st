representation
currentFrame
	^MTRemoteStackFrame gdb: self pointer: (self getVRegister: #FP)