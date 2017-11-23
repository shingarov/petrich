control primitives
isValueMarked
	| frame matchesP |
	frame := MTRemoteStackFrame gdb: gdb pointer: (self receiverOop  bitAnd: 2r11 bitInvert32).
	matchesP := frame method pointer = (gdb exe externalReferences at: #MT_valueMarked).
	self return: (matchesP 
		ifTrue: [ self trueObject ]
		ifFalse: [ self falseObject ])