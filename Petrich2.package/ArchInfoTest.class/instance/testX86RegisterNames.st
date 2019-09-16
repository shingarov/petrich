tests
testX86RegisterNames
	| ai rn |
	ai := 	self aiIA32.
	rn := ai registerNames.
	self
		assert: (rn at: '8')  equals: 'eax';
		assert: (rn at: '12') equals: 'ecx'