examples
initializeFromFile
	| dir f fcontents |
	dir := '/home/boris/PIG/'.
	f := FileStream fileNamed: dir, 'isel-', pdl architectureName.
	fcontents := f contentsOfEntireFile.
	f close.
	invS := (SInvParser instructionSelector: self) 	parse: fcontents