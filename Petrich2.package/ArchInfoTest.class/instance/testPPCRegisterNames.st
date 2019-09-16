tests
testPPCRegisterNames
	| ai rn |
	ai := 	self aiPPC.
	rn := ai registerNames.
	self
		assert: (rn at: '16')  equals: 'gpr0';
		assert: (rn at: '20')  equals: 'gpr1';
		assert: (rn at: '1168')  equals: 'cia'
