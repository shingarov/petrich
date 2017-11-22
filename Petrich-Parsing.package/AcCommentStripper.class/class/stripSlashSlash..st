internal
stripSlashSlash: sourceString
	| language line remover |
	remover := '//' asParser negate star flatten, '//' asParser optional ==> [ :x | x first, ' ' ].
	line := (#newline asParser negate star, #newline asParser) flatten
		==> [ :x | remover parse: x ].
	language := line star.
	^(language parse:  sourceString) inject: '' into: [ :a :b | a, b ]