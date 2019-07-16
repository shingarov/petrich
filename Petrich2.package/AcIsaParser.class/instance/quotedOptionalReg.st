grammar
quotedOptionalReg
	^$" asParser,
	(registerName / '$' asParser) optional,
	$" asParser