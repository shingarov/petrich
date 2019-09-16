tests
testX86NOP
	| ai |
	ai := 	self aiIA32.
	self assert: ai nop equals: #[16r90]