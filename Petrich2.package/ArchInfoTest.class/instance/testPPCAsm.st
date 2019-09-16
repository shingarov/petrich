tests
testPPCAsm
	| ai objectCode |
	ai := 	self aiPPC.
	objectCode := ai asm: 'ori 1,2,15 ;  addi 8,8,25'.
	self assert: objectCode equals: #[96 65 0 15   57 8 0 25]
