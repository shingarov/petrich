disassembly
externalBindingBits
	"Answer the total number of bits in external-bound operands.
	This does NOT mean operands whose value we don't yet know,
	e.g. an RA register-number operand is still external even if
	we may already know which register it is."
	| sum |
	sum := 0.
	format bitFields do: [ :ass |
		(ass key isString and: (internalBindings includesKey: ass key) not) ifTrue: [ sum := sum + ass value abs ]].
	^sum