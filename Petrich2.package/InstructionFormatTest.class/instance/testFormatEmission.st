powerpc
testFormatEmission
	| x4 binary |
	x4 := AcProcessorDescriptions powerpc instructionFormats at: #X4.
	binary := x4 binaryEncoding.
	
	"total instruction length adds up to 32"
	self assert: binary length equals: 32.
	
	"the most-significant 6 bits are the opcd"
	self assert: (binary copyFrom: 31 to: 26) equals: (IntSymbol sym: 'opcd' length: 6).
	
	"the LSB is always 0"
	self assert: (binary copyFrom: 0 to: 0) equals: 0