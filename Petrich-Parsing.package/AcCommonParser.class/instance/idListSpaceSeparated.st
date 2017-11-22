grammar
idListSpaceSeparated
	^id, ((#space asParser star, id) ==> [ :x | x last ]) star
		==> [ :x | x last asSet add: (x first); yourself ]