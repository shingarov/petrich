object access primitives
primAlignedPointerOopAt
	| r idx oop |
	idx := (self getVRegister: #A) >> 4.
	r := (self getVRegister: #R) bitAnd: 2r0011 bitInvert32.
	oop := gdb read32At: r + (idx*4).
	self return: oop