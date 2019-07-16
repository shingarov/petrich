tests - binary width
testAllInstructionsAre32bits
	self allInstructionsAre32bits: AcProcessorDescriptions powerpc.
	self allInstructionsAre32bits: AcProcessorDescriptions mips.
	self allInstructionsAre32bits: AcProcessorDescriptions armv5.
	self allInstructionsAre32bits: AcProcessorDescriptions sparcv8.