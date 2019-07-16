powerpc
testWeirdCharsPPC
	| env parseResult s |
	parseResult := self forPowerPC parse: 'la %reg, %exp@l(%imm)'.
	env := OrderedCollection with: 2 with: 0 with: 16r555.
	s := parseResult value: env.
	self assert: s = 'la 2, 0x0@l(0x555)'