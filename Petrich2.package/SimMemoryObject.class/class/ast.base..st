instance creation
ast: anAST base: addr
	^GenericPyObject
		create: 'angr.storage.memory_object.SimMemoryObject'
 		constructorNamedArgs: ('obj' -> anAST, ('base' -> addr))