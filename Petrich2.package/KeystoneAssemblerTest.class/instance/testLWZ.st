tests-powerpc
testLWZ
	self assert: (self powerpc asm: 'lwz 31, -4(11)') equals: #[16r83 16reb 16rff 16rfc]