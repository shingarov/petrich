as yet unclassified
testManySPARC
	| env parseResult s |
	parseResult := self forSPARC parse: 'Register %reg, %reg, %cond'.
	env := OrderedCollection with: 27 with: 9 with: 5.
	s := parseResult value: env.
	self assert: s = 'Register %i3, %o1, ne'