tests
testX86RegisterNames
	| ai rn |
	ai := 	self aiIA32.
	self assert: ai @'memory_endness' equals: 'Iend_LE'.
	rn := ai registerNames.
	self
		assert: (rn at: '8')  equals: 'eax';
		assert: (rn at: '12') equals: 'ecx'