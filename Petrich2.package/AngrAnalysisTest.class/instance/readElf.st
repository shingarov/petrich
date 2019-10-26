test mock
readElf
	^GenericPyObject
		create: 'angr.Project'
		constructorSequentialArgs: (Array with: '/bin/ls')