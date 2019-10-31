tests-powerpc
testMFLR
	self assert: (self powerpc asm: 'mflr 0') equals: #[16r7c 8 2 16ra6]