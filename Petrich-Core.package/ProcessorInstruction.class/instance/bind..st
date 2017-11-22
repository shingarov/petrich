instantiating
bind: env
	"Answer a ProcessorInstruction where the operands are bound to the environment given by the dictionary env."
	| inst |
	inst := GroundedProcessorInstruction new
		format: format;
		name: name;
		internalBindings: (internalBindings copy);
		yourself.
	inst externalBindings: env.
	inst mnemonics: mnemonics.
	^inst