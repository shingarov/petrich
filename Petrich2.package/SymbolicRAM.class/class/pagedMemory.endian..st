private
pagedMemory: mem endian: bigOrLittle
	| endian |
	endian := bigOrLittle.
	endian = #big ifTrue: [ 'Iend_BE' ].
	endian = #little ifTrue: [ 'Iend_LE' ].
	^GenericPyObject
		create: 'angr.state_plugins.symbolic_memory.SimSymbolicMemory'
		constructorNamedArgs: (Dictionary new 
			at: 'mem' put: mem;
			at: 'memory_id' put: 'mem';
			at: 'endness' put: 'endian';
			yourself).
			