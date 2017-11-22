grammar
regbank
	^'ac_regbank' asParser trim, id, $: asParser, decimalNumber, $; asParser ==>
	[ :x | Array with: 'ac_regbank' -> ((x at: 2) -> (x at: 4)) ]