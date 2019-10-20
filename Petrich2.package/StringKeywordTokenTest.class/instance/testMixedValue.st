tests-value interpretation
testMixedValue
	| source result |
	source := 'ab{Z}<c>d'.
	result := source replaceValueKeywords: [ :key | 'XXX' ].
	self assert: result equals: 'abXXX<c>d'.
	result := source replaceKeywords: [ :key | 'XXX' ].
	self assert: result equals: 'ab{Z}XXXd'