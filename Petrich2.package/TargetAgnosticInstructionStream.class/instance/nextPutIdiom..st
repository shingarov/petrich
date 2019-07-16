idioms
nextPutIdiom: idName
	| instructions |
	instructions := self isel emitIdiom: idName.
	instructions do: [ :i | self nextPutInstruction: i ]