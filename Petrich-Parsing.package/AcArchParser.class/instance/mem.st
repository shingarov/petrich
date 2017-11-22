grammar
mem
	^'ac_mem' asParser trim, id, $: asParser, memSize, $; asParser ==>
		[ :x | Array with: 'ac_mem' -> ((x at: 2) -> (x at: 4)) ]