grammar
setDecoder
	^id, '.set_decoder(' asParser, associationList, ');' asParser
	==> [ :x | 'set_decoder' -> (x first -> x third) ]