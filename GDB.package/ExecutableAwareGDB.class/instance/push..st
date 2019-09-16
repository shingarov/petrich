representation
push: oop
	| sp |
	sp := self getVRegister: #SP.
	self writeInt32: oop toAddr: sp+4.
	self setVRegister: #SP to: sp+4