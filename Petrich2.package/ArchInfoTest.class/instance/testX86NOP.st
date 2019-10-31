tests
testX86NOP
	| ai |
	ai := 	self aiIA32.
	self assert: (ai at: 'nop_instruction') equals: #[16r90]