object access primitives
primAlignedPointerOopAtPut
	| r idx arg2  |
	idx := (self getVRegister: #A) >> 4.
	r := (self getVRegister: #R) bitAnd: 2r00011 bitInvert32.
	arg2 := gdb currentFrame arg: 2.
	gdb writeInt32: arg2 toAddr: r + (idx*4).
	self markSuccess 