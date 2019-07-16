tests - decoding
testDecodePartial
	| ori  partialBinary concrete |
	ori := AcProcessorDescriptions powerpc instructionAt: 'ori'.
	partialBinary := (16r6083 asBitVector: 16), (IntSymbol sym: 'UnsignedImmediate' length: 16). "ori 3,4,UnsignedImmediate"
	concrete := ori decode: partialBinary.
	self assert: (concrete fieldValue: 'opcd') equals: 24.
	self assert: (concrete field: 'ra') length equals: 5.
	self assert: (concrete field: 'ra') value equals: 3.
	self assert: (concrete fieldValue: 'rs') equals: 4.
	