accessing
primitiveProcessor
	primitiveProcessor isNil ifTrue: [ primitiveProcessor := PrimitiveProcessor gdb: gdb ].
	^primitiveProcessor 