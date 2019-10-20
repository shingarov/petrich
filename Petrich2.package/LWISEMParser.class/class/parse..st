as yet unclassified
parse: aReadStream 
	^(ExpectingNextInstruction from: aReadStream instructionsSoFar: Dictionary new) parse