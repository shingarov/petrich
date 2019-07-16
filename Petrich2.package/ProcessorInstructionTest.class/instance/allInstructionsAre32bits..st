tests - binary width
allInstructionsAre32bits: aPDL
	aPDL instructions do: [ :instr |
		"total instruction length adds up to 32"
		self assert: instr binaryEncoding length equals: 32 ]