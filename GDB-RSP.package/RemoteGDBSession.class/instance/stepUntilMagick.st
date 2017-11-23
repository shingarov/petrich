magick
stepUntilMagick
	self stepUntil: [ self currentInstructionEncoding = self exe objectMemory targetSetup magicInstruction ]