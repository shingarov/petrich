tests - decoding
testDecodeUnsat
	| ori |
	ori := AcProcessorDescriptions powerpc instructionAt: 'ori'.
	[ ori decode: 0 ] "inconsistent with ori"
		on: Unsat do: [ ^self ].
	self assert: false.