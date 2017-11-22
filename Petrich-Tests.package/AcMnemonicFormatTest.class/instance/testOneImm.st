as yet unclassified
testOneImm
	| env parseResult s |
	parseResult := self forPowerPC parse: 'One #%imm imm'.
	env := OrderedCollection with: 5.
	s := parseResult value: env.
	self assert: s = 'One #0x5 imm'