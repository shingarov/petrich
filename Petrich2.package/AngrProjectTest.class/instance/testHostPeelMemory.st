tests
testHostPeelMemory
	| proj arch entry factory b memView memory pagedMemory clemory |
	proj := GenericPyObject
		create: 'angr.Project'
		constructorSequentialArgs: (Array with: '/bin/ls').
	self assert: proj pyClass name equals: 'Project'.
	entry := proj at: 'entry'.
	factory := proj at: 'factory'.
	memView  := factory entry_state mem.
	memory := factory entry_state memory.
	pagedMemory := memory @ 'mem'.
	clemory := pagedMemory @ '_memory_backer'.
	
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
	
