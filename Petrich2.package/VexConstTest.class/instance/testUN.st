tests
testUN
	| x c |
	x := IntSymbol sym: 'x' length: 16.
	c := VexUN value: x.
	self assert: c value equals: x