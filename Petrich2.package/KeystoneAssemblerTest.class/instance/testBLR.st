tests-powerpc
testBLR
	self assert: (self powerpc asm: 'blr') equals: #[16r4e 16r80 16r0 16r20]