printing
printOn: aStream
	[ aStream nextPutAll: self disassemble ]
		on: Error
		do: [ aStream nextPutAll: 'a GroundedProcessorInstruction [error disassembling]' ]
	