access
solver
	solver isNil ifTrue: [ self cacheSolver ].
	^solver