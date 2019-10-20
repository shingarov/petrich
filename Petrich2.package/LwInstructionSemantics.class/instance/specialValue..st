substitution
specialValue: key
	"There are special keys in the DSL
	that aren't fields in the instruction,
	such as the instruction's address."
	
	key = 'addr' ifTrue: [ ^self addr ].
	key = 'encodingLength' ifTrue: [ ^self encodingLength ].
	key = 'nextAddress' ifTrue: [ ^self nextAddress ].
	
	KeyNotFound signalFor: key
	