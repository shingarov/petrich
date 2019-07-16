tests
testMissingLRight
	| result |
	result := MatchedParenTestParser new parse: '(asdf'.
	self assert: result isPetitFailure 