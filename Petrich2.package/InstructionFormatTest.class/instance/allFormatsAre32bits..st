all
allFormatsAre32bits: aPDL
	aPDL instructionFormats do: [ :f |
		"total instruction length adds up to 32"
		self assert: f binaryEncoding length equals: 32 ]