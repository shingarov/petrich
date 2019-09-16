tests
testInstantiateProjectIA32
	| proj arch |
	proj := GenericPyObject
		create: 'angr.Project'
		constructorSequentialArgs: (Array with: '/home/boris/ret42').
	self assert: proj pyClass name equals: 'Project'.
	arch := proj at: 'arch'.
	self
		assert: (arch at: 'bits') equals: 32;
		assert: (arch at: 'name') equals: 'X86';
		assert: (arch at: 'linux_name') equals: 'i386';
		assert: (arch at: 'qemu_name') equals: 'i386';
		assert: (arch at: 'triplet') equals: 'i386-linux-gnu';
		assert: (arch at: 'memory_endness') equals: 'Iend_LE'
	
