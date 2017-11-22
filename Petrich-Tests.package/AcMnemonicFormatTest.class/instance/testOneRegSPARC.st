as yet unclassified
testOneRegSPARC
	| env parseResult s |
	parseResult := self forSPARC parse: 'Register %reg'.
	env := OrderedCollection with: 27.
	s := parseResult value: env.
	self assert: s = 'Register %i3'