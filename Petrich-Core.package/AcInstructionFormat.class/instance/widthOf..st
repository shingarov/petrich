accessing
widthOf: fieldName
	" Answer the width of the field, negated if the field
	  is a two's complement-encoded signed.
	  Assume the field exists, otherwise crash."
	
	"NB we can't use Dictionary>>newFromAssociations:, because some
	 constant (Integer-named) fields can have the same key.
	 See InstructionFormatTest>>testMcrf"
	self bitFields do: [ :assoc |
		assoc key = fieldName ifTrue: [ ^assoc value ]
	].
	KeyNotFound signalFor: fieldName