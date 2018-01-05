emitting
stringValueOf: fieldName usingFormat: f
	| encodedWidth operandValue |
	encodedWidth := f widthOf: fieldName.
	"if we got here, the field exists, whether external or internal"
		
	[ operandValue := self encodedValueOf: fieldName width: encodedWidth ]
		on: KeyNotFound do: [ ^'?' repeat: encodedWidth abs ].
	^operandValue printStringBase: 2 nDigits: encodedWidth abs