tests
testPPCRegisterOffsets
	| ai |
	ai := 	self aiPPC.
	self
		assert: (ai registerOffset: 'gpr0')  equals: 16;
		assert: (ai registerOffset: 'cia')   equals: 1168