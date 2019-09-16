test mock
onePPCInst
	| text |
	text := #(16r3c 16r60 16r12 16r34) asByteArray.
	^IRSB code: text addr: 16r100 arch: 'powerpc'.
