tests
testABranch
	| proj arch |
	proj := GenericPyObject
		create: 'angr.Project'
		constructorSequentialArgs: (Array with: '/Users/boris/lamya/aBranch').
	self assert: proj pyClass name equals: 'Project'.
	arch := proj at: 'arch'.
	arch asm: 'mflr 0'.
	self
		assert: (arch at: 'bits') equals: 64;
		assert: (arch at: 'name') equals: 'AMD64';
		assert: (arch at: 'linux_name') equals: 'x86_64';
		assert: (arch at: 'qemu_name') equals: 'x86_64';
		assert: (arch at: 'triplet') equals: 'x86_64-linux-gnu';
		assert: (arch at: 'memory_endness') equals: 'Iend_LE'
	