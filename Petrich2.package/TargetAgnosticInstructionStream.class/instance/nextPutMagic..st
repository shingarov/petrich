surgery
nextPutMagic: callNo
	self
		nextPutIdiom: 'LoadImm32'
		op1: MTXABI regHypervisorCallNo 
		op2: callNo.
	
	self insertBreakHere;
		nextPutInstruction: magicInstruction