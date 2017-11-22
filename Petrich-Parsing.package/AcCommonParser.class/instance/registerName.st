grammar
registerName
	| idPresent |
	idPresent := ( $$ asParser / $% asParser ) optional,
		(id / decimalNumber). 
	^idPresent flatten