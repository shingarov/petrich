tests
testMapBodyForm2
	" id[a..b] = [c..d] "
	| result |
	result := self parseStatement: 'ac_asm_map m { "x"[0..3] = [10..13]; }'.
		self halt.