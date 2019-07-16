emitting
emit32
	"Just making mischief.
	Some not-so-nice ISAs do not allow this (not that I care)."
	format binaryEncoding length = 32 ifFalse: [ self error: 'Instruction size not 32' ].
	^binaryEncoding value