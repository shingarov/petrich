disassembly
decode: anInteger
	"Return the ProcessorInstruction object encoded by anInteger,
	 or nil if this instruction does not match the binary."

	^(GroundedProcessorInstruction new initializeFrom: self)
		decode: anInteger
		accordingTo: format bitFields.

	