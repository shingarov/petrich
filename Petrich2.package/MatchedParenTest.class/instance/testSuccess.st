tests
testSuccess
	| result |
	result := MatchedParenTestParser new parse: '(asdf)'.
	self assert: result equals: '(asdf)'