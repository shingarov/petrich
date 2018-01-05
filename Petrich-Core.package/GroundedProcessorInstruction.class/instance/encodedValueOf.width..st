emitting
encodedValueOf: fieldName width: encodedWidth
	| absWidth operandValue |
	absWidth := encodedWidth abs.
	operandValue := self arithmeticValueOf: fieldName.
	"If the field is signed, encode as two's complement according to the width"
	^encodedWidth negative
		ifTrue: [ operandValue encodeSignedWidth: absWidth ]
		ifFalse: [ operandValue encodeUnsignedWidth: absWidth ].