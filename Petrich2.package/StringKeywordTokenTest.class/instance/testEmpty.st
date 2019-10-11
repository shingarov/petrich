tests
testEmpty
	| result |
	result := '' replaceKeywords: [ :key | 'XXX' ].
	self assert: result equals: ''