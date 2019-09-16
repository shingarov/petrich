control primitives
primIsBottomOfStack
	| bottomP frame |
	frame := MTRemoteStackFrame gdb: gdb pointer: ((self getVRegister: #R) bitAnd: 2r11 bitInvert32).
	bottomP := frame isBottomFrame.
	self return: (bottomP 
		ifTrue: [ self trueObject ]
		ifFalse: [ self falseObject ])