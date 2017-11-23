API
process
	| callNo |
	callNo := gdb getRegisters at: 'r22'. "cf. TAJWriter>>nextPutMagic:"
	callNo = 1 ifTrue: [ ^self messageSend ].
	callNo = 2 ifTrue: [ ^self primitive ].
	callNo = 3 ifTrue: [ ^self return ].
	callNo = 4 ifTrue: [ ^self privatePrimitive ].
	callNo = 5 ifTrue: [ ^self call ].
	callNo = 6 ifTrue: [ ^self handleDNU ].
	callNo = 7 ifTrue: [ ^self inspectionPoint ].
	self halt  "Unknown callback"