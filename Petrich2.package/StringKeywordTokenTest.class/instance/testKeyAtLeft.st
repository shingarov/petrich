tests
testKeyAtLeft
	| result |
	result := '<Z>cd' replaceKeywords: [ :key | 'XXX' ].
	self assert: result equals: 'XXXcd'