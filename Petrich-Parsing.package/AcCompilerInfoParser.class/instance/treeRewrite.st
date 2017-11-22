grammar-machine specific
treeRewrite
	^matchedParen trim,
	'=>' asParser trim,
	matchedParen trim,
	$; asParser
	==> [ :x | 'treeRewrite' -> x ]