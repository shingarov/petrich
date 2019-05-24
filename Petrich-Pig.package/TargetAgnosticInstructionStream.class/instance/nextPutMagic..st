surgery
nextPutMagic: callNo
	self
		nextPutIdiom: 'LoadImm32'
		op1: 22 "magic No. in R22"
		op2: callNo.
	
	self insertBreakHere;
		nextPutInstruction: magicInstruction