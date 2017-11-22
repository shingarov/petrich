emitting
emit
	| shift encoding |
	shift := 0.
	encoding := 0.
	format bitFields do: [ :field |
		| fieldName fieldWidth operandValue |
		fieldName := field key.
		fieldWidth := field value abs.
		encoding := encoding bitShift: fieldWidth.
		operandValue := self valueOf: fieldName.
		"If the field is signed, encode as two's complement according to the width"
		operandValue := field value negative
			ifTrue: [ operandValue encodeSignedWidth: fieldWidth ]
			ifFalse: [ operandValue encodeUnsignedWidth: fieldWidth ].
		encoding := encoding bitOr: operandValue.
		 ].
	^encoding