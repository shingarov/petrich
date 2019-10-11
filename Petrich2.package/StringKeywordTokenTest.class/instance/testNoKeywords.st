tests
testNoKeywords
	| result |
	result := 'abcd' replaceKeywords: [ :key | 'XXX' ].
	self assert: result equals: 'abcd'