accessing
callingConventions
	callingConventions isNil ifTrue: [ callingConventions := Set new ].
	^ callingConventions