accessing
widthOf: fieldName
	"Answer the width of the field (always positive)."
	
	"NB we can't use Dictionary>>newFromAssociations:, because some
	 constant (Integer-named) fields can have the same key.
	 See InstructionFormatTest>>testMcrf"
	self bitFields do: [ :assoc |
		assoc key = fieldName ifTrue: [ ^assoc value abs ]
	].
	KeyNotFound signalFor: fieldName