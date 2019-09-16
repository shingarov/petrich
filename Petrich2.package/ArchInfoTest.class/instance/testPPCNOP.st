tests
testPPCNOP
	| ai nop i |
	ai := 	self aiPPC.
	nop := ai nop.
	i := nop longAt: 1 bigEndian: true.
	self assert: i equals: 16r60000000