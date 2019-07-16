grammar
idList
	^id, (($, asParser trim, id) ==> [ :x | x last ]) star
		==> [ :x | x last asSet add: (x first); yourself ]