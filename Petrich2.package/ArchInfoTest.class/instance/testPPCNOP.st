tests
testPPCNOP
	| ai nop i |
	ai := 	self aiPPC.
	nop := ai at: 'nop_instruction'.
	i := nop longAt: 1 bigEndian: true.
	self assert: i equals: 16r60000000