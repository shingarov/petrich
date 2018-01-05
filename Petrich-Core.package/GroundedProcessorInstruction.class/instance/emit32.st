emitting
emit32
	" Emit the instruction as a 32-bit integer. "
	| s |
	s := self emit.
	s size = 32 ifFalse: [ self error: 'Instruction size not 32' ].
	^Integer readFrom: s base: 2