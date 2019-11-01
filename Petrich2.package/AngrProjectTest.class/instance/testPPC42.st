tests
testPPC42
	| proj arch entry factory b mem |
	proj := GenericPyObject
		create: 'angr.Project'
		constructorSequentialArgs: (Array with: '/Users/boris/lamya/ppc42').
	self assert: proj pyClass name equals: 'Project'.
	entry := proj at: 'entry'.
	factory := proj at: 'factory'.
	mem := factory entry_state mem.
	
	"Don't send #keys: Clemory has no attribute 'keys'"
	
	b := factory block: entry.
	arch := proj at: 'arch'.
	arch asm: 'mflr 0'.
	self
		assert: (arch at: 'bits') equals: 64;
		assert: (arch at: 'name') equals: 'AMD64';
		assert: (arch at: 'linux_name') equals: 'x86_64';
		assert: (arch at: 'qemu_name') equals: 'x86_64';
		assert: (arch at: 'triplet') equals: 'x86_64-linux-gnu';
		assert: (arch at: 'memory_endness') equals: 'Iend_LE'
	
