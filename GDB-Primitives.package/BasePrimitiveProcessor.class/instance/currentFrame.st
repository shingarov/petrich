engine
currentFrame
"NB -- this is problematic, this parallel implementation with GDB"
	^MTRemoteStackFrame gdb: gdb pointer: (self getVRegister: #FP)