tests
readElf
	^GenericPyObject
		create: 'angr.Project'
		constructorSequentialArgs: (Array with: '/home/boris/work/thinshell/doodles/simple-graph.elf')
