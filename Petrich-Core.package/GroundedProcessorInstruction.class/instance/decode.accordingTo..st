disassembly
decode: anInteger accordingTo: bitfieldAssociationSequence
	"This unfortunate method factorization is forced by an opportunity for improvement in the Pharo debugger.
	Modify thyself according to the bitfieldAssociationSequence specification whose values are either
	verified to correspond to (if internal), or set to (if external), the bit values in anInteger.
	If internal values are wrong (so it's the wrong instruction), answer nil."
	| firstBitfield width value fieldName |
	bitfieldAssociationSequence size == 0 ifTrue: [ ^self ].
	firstBitfield := bitfieldAssociationSequence first.
	width := firstBitfield value abs.
	value := anInteger >> (32 - width).
	fieldName := firstBitfield key.
	[(internalBindings at: fieldName) = value ifFalse: [^nil]]
		on: KeyNotFound
		do: [ :ex | externalBindings at: fieldName put: value ].
	^self
		decode: (anInteger << width bitAnd: 16rFFFFFFFF)
		accordingTo: (bitfieldAssociationSequence copyFrom: 2 to: bitfieldAssociationSequence size).
