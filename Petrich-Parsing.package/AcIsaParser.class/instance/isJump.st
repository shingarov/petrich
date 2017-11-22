grammar
isJump
	^id,
	'.is_jump' asParser,
	matchedParen,
	$; asParser
	==> [ :x | 'is_jump' -> x ]