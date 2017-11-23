representation
pharoObjectForOop: oop
	| tag |
	tag := oop bitAnd: 2r111.
	tag == 0 ifTrue: [ ^MTRemoteObject gdb: self pointer: oop ].
	tag == 1 ifTrue: [ ^exe architecture oop >> 4 ]. "SmallInteger; this code better delegate to the Target"
	tag == 3 ifTrue: [ ^MTRemoteObject gdb: self pointer: (oop bitAnd: 16rFFFFFFF0) ].
	self halt "I don't know what tag this is"