powerpc
testFormatEmission
	| f x4 |
	f := AcProcessorDescriptions powerpc instructionFormats.
	x4 := f at: #X4.
	self assert: x4 emit equals: '###############################0'