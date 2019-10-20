tests-value interpretation
testValueResistance
	| result |
	result := 'ab{Z}cd' replaceKeywords: [ :key | 'XXX' ].
	self assert: result equals: 'ab{Z}cd'