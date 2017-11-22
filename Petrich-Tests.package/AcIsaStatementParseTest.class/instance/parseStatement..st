tests
parseStatement: aString
	| result |
	result := AcIsaParser new
		parse: 'AC_ISA(test) { ', aString, ' };'.
	^result first
