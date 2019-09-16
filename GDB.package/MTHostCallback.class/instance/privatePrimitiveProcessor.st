accessing
privatePrimitiveProcessor
	privatePrimitiveProcessor isNil ifTrue: [ privatePrimitiveProcessor := PrivatePrimitiveProcessor gdb: gdb ].
	^privatePrimitiveProcessor 