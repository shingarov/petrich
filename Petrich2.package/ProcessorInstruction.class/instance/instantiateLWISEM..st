LWISEM
instantiateLWISEM: aString 
	"First, substitute uninterpreted fields."
	^(aString replaceKeywords: [ :key | (self field: key) representSmalltalkInPython ])
	"Then, substitute field values"
	replaceValueKeywords: [ :key | (self fieldValue: key) representSmalltalkInPython ]