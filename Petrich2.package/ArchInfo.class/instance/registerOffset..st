functions
registerOffset: regName
	^Integer readFrom: (self registerNames keyAtValue: regName)