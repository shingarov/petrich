accessing
isSigned: fieldName
	"Answer whether the field is signed."
	self bitFields do: [ :assoc |
		assoc key = fieldName ifTrue: [ ^assoc value < 0 ]
	].
	KeyNotFound signalFor: fieldName