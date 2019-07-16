grammar-semantics
semanticTree
	^let optional, matchedParen , $; asParser
	==> [ :x | Array
		with: (x first isNil ifTrue: [Dictionary new] ifFalse: [x first])
		with: x second ]
