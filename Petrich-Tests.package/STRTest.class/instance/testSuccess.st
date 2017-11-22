as yet unclassified
testSuccess
	| result |
	result := STRTestParser new parse: '"asdf"'.
	self assert: result equals: 'asdf'