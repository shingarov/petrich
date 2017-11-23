control primitives
primSetExceptionEnvironment
	| ee |
	ee := self getVRegister: #A.
	self setExceptionEnvSlot: ee;
		markSuccess 