emitting
emit
	^self bitFields inject: '' into: [ :soFar :field |
		| fieldName s |
		fieldName := field key.
		s := (fieldName isKindOf: Integer)
			ifTrue: [ fieldName printStringBase: 2 nDigits: field value ]
			ifFalse: [ '#' repeat: field value abs ].
		soFar, s ]