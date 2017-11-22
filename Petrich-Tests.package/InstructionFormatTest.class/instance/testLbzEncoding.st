tests-powerpc
testLbzEncoding
	" lbz r2, 0xABCD(r7) "
	| binary |
	binary := self anLbz emit.
	self assert: binary = 16r8847ABCD