access
field: fieldName
	"Answer the value of the requested field, as a bit vector."
	^binaryEncoding subrange: (self rangeOf: fieldName)