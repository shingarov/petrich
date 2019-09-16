accessing
buffer
	buffer isNil ifTrue: [ buffer := ByteArray new: (4*1024*1024) + (1024*1024) + (80*1024*1024) ].
	^buffer