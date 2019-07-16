tests - decoding
testDecodeInt
	| ori concrete |
	ori := AcProcessorDescriptions powerpc instructionAt: 'ori'.
	concrete := ori decode: 16r60830001. "ori 3,20,0x1"
	self deny: concrete binaryEncoding isSymbolic.
	self assert: ori binaryEncoding isSymbolic. "check that #decode: did not destroy the original"
	self assert: concrete name equals: 'ori'.
	self assert: concrete binaryEncoding value equals: 16r60830001