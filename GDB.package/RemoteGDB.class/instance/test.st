tests
test
	| x |
self halt.
	x := self getRegisters.
	self s.
	x := self read32At: 16r8150.
	x := self readAt: 16r814c nBytes: 4.
	x := self getRegisters.
	
	
	