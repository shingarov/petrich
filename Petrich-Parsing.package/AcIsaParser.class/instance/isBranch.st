grammar
isBranch
	^id,
	'.is_branch' asParser,
	matchedParen,
	$; asParser
	==> [ :x | 'is_branch' -> x ]