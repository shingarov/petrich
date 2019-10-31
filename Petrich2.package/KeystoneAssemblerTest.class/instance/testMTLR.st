tests-powerpc
testMTLR
	self assert: (self powerpc asm: 'mtlr 0') equals: #[16r7c 8 3 16ra6]