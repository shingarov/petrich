magick
runUntilMagick
	self runUntil: [ self currentInstructionEncoding = (Integer readFrom: self exe objectMemory targetSetup magicInstruction radix: 2) ]