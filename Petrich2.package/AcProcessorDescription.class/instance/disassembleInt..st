disassembly
disassembleInt: anInteger
	"Answer the most-descriptive ProcessorInstruction object encoded by anInteger.
	Most-descriptive means the most-concretized form of writing."
	| candidates |
	candidates := instructions collect: [ :instr |
		[instr decode: anInteger] on: Unsat do: [ nil ] ].
	candidates := candidates reject: [ :instr | instr isNil ].
	candidates isEmpty ifTrue: [self error: 'Invalid instruction encoding'].
	candidates := candidates values.
	^(candidates asSortedCollection:  [ :a :b | a externalBindingBits < b externalBindingBits ]) first