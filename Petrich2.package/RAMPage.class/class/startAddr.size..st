instance creation
startAddr: addr size: size
	"Create a new Page"
	| initParms |
	initParms := Dictionary new
		at: 'page_addr' put: addr;
		at: 'page_size' put: size;
		yourself.
	^GenericPyObject create: 'angr.storage.paged_memory.Page' constructorNamedArgs: initParms