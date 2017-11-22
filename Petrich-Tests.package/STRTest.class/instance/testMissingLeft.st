as yet unclassified
testMissingLeft
	| result |
	result := STRTestParser new parse: 'asdf"'.
	self assert: result isPetitFailure 