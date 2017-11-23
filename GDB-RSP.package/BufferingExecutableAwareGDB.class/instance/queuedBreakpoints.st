accessing
queuedBreakpoints
	queuedBreakpoints isNil ifTrue: [ queuedBreakpoints := OrderedCollection new ].
	^queuedBreakpoints