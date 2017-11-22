tests
testMissingLeft
	| result |
	result := MatchedParenTestParser new parse: 'asdf)'.
	self assert: result isPetitFailure 