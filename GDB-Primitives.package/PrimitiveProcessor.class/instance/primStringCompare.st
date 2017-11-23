feature primitives
primStringCompare
	| r b answer |
	r := self getVRegister: #R.
	r := MTRemoteString gdb: gdb pointer: r.
	r := r string.
	
	b := self getVRegister: #A.
	b := MTRemoteString gdb: gdb pointer: b.
	b := b string.
	
	answer := r = b ifTrue: [2] ifFalse: [ r < b ifTrue: [1] ifFalse: [3] ].
	answer := gdb exe architecture integerToSmallInteger: answer.
	self return: answer