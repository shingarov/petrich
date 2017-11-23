control primitives
primPreviousContext
	| context prevAddr |
	context := self receiverOop.
	context := context bitAnd: 3 bitInvert32.
	prevAddr := gdb read32At: context.
	self return: (prevAddr bitOr: 3)