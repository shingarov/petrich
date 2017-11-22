logic
printLogicOn: aStream
	self
		printEmitGoalOn: aStream;
		printRegisterAllocatorOn: aStream;
		printUtilityFunctionsOn: aStream;
		printEquivalenceTheoryOn: aStream;
		printInstructionRewriteRulesOn: aStream;
		printAlgebraOn: aStream;
		printCompositionRulesOn: aStream 