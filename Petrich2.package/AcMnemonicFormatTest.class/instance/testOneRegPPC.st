powerpc
testOneRegPPC
	| env parseResult s |
	parseResult := self forPowerPC parse: 'Register %reg'.
	env := OrderedCollection with: 2.
	s := parseResult value: env.
	self assert: s = 'Register 2'