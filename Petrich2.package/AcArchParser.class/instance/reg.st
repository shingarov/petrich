grammar
reg
	^('ac_reg' asParser,
	('<' asParser, decimalNumber, '>' asParser) optional) trim,
	idList,
	';' asParser
		==> [ :x | x second collect: [ :regName | Association key: 'ac_reg' value: regName ] ]