tests - decoding
testLbz
	"LBZ D-form (PPCArch, p.50):
	 lbz r2, 0x0001(r7) "

	| lbz decoded offset |
	lbz := AcProcessorDescriptions powerpc instructionAt: #lbz.
	decoded := lbz decode: 16r8847FFFF.
	offset := decoded fieldValue: 'd'.
	self assert: offset equals: -1