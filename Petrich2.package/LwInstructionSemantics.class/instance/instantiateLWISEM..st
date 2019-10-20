substitution
instantiateLWISEM: aString 
	"First, substitute uninterpreted fields."
	^(aString replaceKeywords: [ :key | self substituteUninterpreted: key ])
	"Then, substitute field values"
	replaceValueKeywords: [ :key | self substituteValue: key ]