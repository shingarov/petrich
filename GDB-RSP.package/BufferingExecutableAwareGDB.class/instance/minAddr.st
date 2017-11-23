accessing
minAddr
	minAddr isNil ifTrue: [ minAddr := self getVRegister: #NZone ].
	^minAddr