instance creation
startAddr: addr size: size executable: aBoolean
	"Create a new Page"
	| initParms |
	initParms := Dictionary new
		at: 'page_addr' put: addr;
		at: 'page_size' put: size;
		at: 'executable' put: aBoolean;
		yourself.
	^GenericPyObject create: 'angr.storage.paged_memory.Page' constructorNamedArgs: initParms