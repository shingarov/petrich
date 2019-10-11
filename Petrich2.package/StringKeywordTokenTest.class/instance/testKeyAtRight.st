tests
testKeyAtRight
	| result |
	result := 'ab<Z>' replaceKeywords: [ :key | 'XXX' ].
	self assert: result equals: 'abXXX'