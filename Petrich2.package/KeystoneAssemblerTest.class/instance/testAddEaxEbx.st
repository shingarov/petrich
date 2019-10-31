tests-x86
testAddEaxEbx
	self assert: (self x86 asm: 'add eax, ebx') equals: #[1 16rd8]