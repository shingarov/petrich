control primitives
primReturnValueFromContext
	| ctx |
	self setVRegister: #R to: (self getVRegister: #A).
	ctx := gdb read32At: (self getVRegister: #FP) - 8.
	ctx := ctx bitAnd: 2r11 bitInvert32. "strip off context immediate tag"
	self setVRegister: #FP to: ctx.
	self setVRegister: #SP to: ctx + 4.
	self markSuccess 