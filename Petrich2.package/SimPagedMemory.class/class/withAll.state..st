instance creation
withAll: anArrayOfPages state: aSimState
	| namedArgs result |
	namedArgs := Dictionary new.
	anArrayOfPages isNil ifFalse: [
		| pagesDictionary |
		pagesDictionary := Dictionary new.
		anArrayOfPages doWithIndex: [ :page :index |
			pagesDictionary at: index - 1 put: page ].
		namedArgs at: 'pages' put: pagesDictionary ].
	result := GenericPyObject
		create: 'angr.storage.paged_memory.SimPagedMemory'
		constructorNamedArgs: namedArgs.
	aSimState isNil ifFalse: [ result at: 'state' put: aSimState ].
	^result
