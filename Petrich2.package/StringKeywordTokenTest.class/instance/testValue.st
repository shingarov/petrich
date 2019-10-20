tests-value interpretation
testValue
	| result |
	result := 'ab{Z}cd' replaceValueKeywords: [ :key | 'XXX' ].
	self assert: result equals: 'abXXXcd'