primitives
primBasicSize
	| answer |
" NB: insert prim failure guards here, such as SmallInteger "
	answer := (MTRemoteLiveObject gdb: gdb liveObject: self receiverOop) numIndexed.
	answer := (answer bitShift: 4) bitOr: 2r0001. "SI"
	self return: answer