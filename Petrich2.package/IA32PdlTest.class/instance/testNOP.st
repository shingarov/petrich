tests
testNOP
	| nop binary |
	nop := AcProcessorDescriptions x86 instructionAt: #nop.
	binary := nop emit. "0x90"
	self assert: binary equals: '10010000'