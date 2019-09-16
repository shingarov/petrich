test mock
anotherPPCInst
	| text |
	text := #(16r60 16r63 16r56 16r78) asByteArray.
	^IRSB code: text addr: 16r104 arch: 'powerpc'.
