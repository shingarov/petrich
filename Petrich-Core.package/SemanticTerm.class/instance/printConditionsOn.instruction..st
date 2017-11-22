logic
printConditionsOn: aStream instruction: instruction
	args do: [ :arg | arg printConditionsOn: aStream instruction: instruction ].
