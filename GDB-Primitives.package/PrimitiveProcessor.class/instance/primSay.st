feature primitives
primSay
	" Show the receiver SI on the host transcript. "
	| something tag |
self halt.
	something := self getVRegister: #R.
	tag := something bitAnd: 2r00011.
	tag = 0 ifTrue: [ something := 'oop:', something asString, ' md:', (MTRemoteObject gdb: gdb pointer: something) md printString ].
	tag = 1 ifTrue: [ something := gdb exe architecture smallIntegerToInteger: something ].
	
	Transcript show: ('Modtalk says: ', something asString); cr.
	self markSuccess.


	