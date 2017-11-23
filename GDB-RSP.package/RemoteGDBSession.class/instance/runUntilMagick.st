magick
runUntilMagick
	self runUntil: [ self currentInstructionEncoding = self exe objectMemory targetSetup magicInstruction ]