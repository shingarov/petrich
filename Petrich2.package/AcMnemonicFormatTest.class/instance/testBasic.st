powerpc
testBasic
	| env parseResult fmt |
	fmt := 'Simple string'.
	parseResult := self forPowerPC parse: fmt.
	env := OrderedCollection new.
	self assert: (parseResult value: env) = fmt