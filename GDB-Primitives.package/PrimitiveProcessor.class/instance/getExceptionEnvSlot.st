accessing
getExceptionEnvSlot 
	exceptionEnvSlot isNil ifTrue: [ exceptionEnvSlot := self nilObject ].
	^exceptionEnvSlot 