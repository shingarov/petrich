feature primitives
primPrintString
	| r tag |
self halt.
	r := self receiverOop.
	tag := r bitAnd: 2r00011.
	tag = 0 ifTrue: [ 
		"For pointer oops, assume it's a String"
		| rs |
		rs := MTRemoteString gdb: gdb pointer: r.
		Transcript show: rs string.
		^self markSuccess 		
	].
	tag = 1 ifTrue: [
		Transcript show: (r>>4) printString.
		^self markSuccess 		
	].
	self halt