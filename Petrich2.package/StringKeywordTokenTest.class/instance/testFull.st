tests
testFull
	| result |
	result := 'ab<Z>cd' replaceKeywords: [ :key | 'XXX' ].
	self assert: result equals: 'abXXXcd'