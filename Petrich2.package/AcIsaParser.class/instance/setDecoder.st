grammar
setDecoder
	^id,
	'.set_decoder' asParser,
	$  asParser star,
	$( asParser,
	$  asParser star,
	associationList,
	');' asParser trim
	==> [ :x | 'set_decoder' -> (x first -> x sixth) ]