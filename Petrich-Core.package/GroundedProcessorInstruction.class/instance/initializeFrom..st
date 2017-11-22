initializing
initializeFrom: anInstruction
	name := anInstruction name.
	isa := anInstruction isa.
	format := anInstruction format.
	internalBindings := anInstruction internalBindings copy.
	mnemonics := anInstruction mnemonics.
	semantics := anInstruction semantics.
	externalBindings := Dictionary new.
	^self