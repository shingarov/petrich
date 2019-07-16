accessing
positionOf: fieldName
	" Answer the bit-number (where the LSB is 0) the MSB of the field.
	  Assume the field exists, otherwise signal KeyNotFound."
	| i |
	i := -1.
	self bitFields reversed do: [ :assoc |
		i := i + assoc value abs.
		assoc key = fieldName ifTrue: [ ^i ]
	].
	KeyNotFound signalFor: fieldName