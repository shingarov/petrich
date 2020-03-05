accessing
associations
	^self keys collect: [ :regName |
		regName -> (self at: regName) printForRegisterInspector ]
