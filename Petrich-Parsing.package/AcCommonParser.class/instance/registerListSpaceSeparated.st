grammar
registerListSpaceSeparated
	^registerName, ((#space asParser star, registerName) ==> [ :x | x last ]) star
		==> [ :x | x last asSet add: (x first); yourself ]