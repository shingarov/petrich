grammar-semantics
semanticFragment
	^'define semantic fragment' asParser trim,
	id,
	'as' asParser trim,
	matchedParen,
	$; asParser
	==> [ :x | 'fragment' -> x ]