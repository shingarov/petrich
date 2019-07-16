powerpc
testFormatOfInstruction
	| pdl |
	pdl := AcProcessorDescriptions powerpc.
	self assert: (pdl instructionAt: #mcrf) format name   equals: 'XL3'.
	self assert: (pdl instructionAt: #lwz) format name    equals: 'D1'.
	self assert: (pdl instructionAt: #rlwinm) format name equals: 'M2'.
	self assert: (pdl instructionAt: #cmpi) format name   equals: 'D5'.

