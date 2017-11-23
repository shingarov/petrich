disassembly
externalBindingBits
	"Answer the total number of bits in external-bound operands."
	^self externalBindings keys
		inject: 0
		into: [:subTotal :nextField | subTotal + (format widthOf: nextField) ].
	