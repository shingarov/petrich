disassembly
disassemble: anInteger
	"Answer the AcInstructionInstance object encoded by anInteger."
	| candidates |
	candidates := instructions collect: [ :instr |
		instr decode: anInteger ].
	candidates := candidates reject: [ :instr | instr isNil ].
	candidates isEmpty ifTrue: [self error: 'Invalid instruction encoding'].
	^(candidates asSortedCollection:  [ :a :b | a externalBindingBits < b externalBindingBits ]) first