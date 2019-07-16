all
testAllFormatsAre32bits
	self allFormatsAre32bits: AcProcessorDescriptions powerpc.
	self allFormatsAre32bits: AcProcessorDescriptions mips.
	self allFormatsAre32bits: AcProcessorDescriptions armv5.
	self allFormatsAre32bits: AcProcessorDescriptions sparcv8.