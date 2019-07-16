access
fieldValue: fieldName
	"Answer the value of the requested field, as an Integer
	(observing two's complement if required)."
	| bitVector |
	bitVector := self field: fieldName.
	^(format isSigned: fieldName)
		ifTrue: [ bitVector signedValue ]
		ifFalse: [ bitVector value ]