internal
stripSlashStar: sourceString
	| language commented |
	commented  := PPDelegateParser  new.
	language := '/*' asParser negate star end flatten  / commented.
	commented setParser: 
		'/*' asParser negate star flatten,
		'/*' asParser ,
		'*/' asParser negate star ,
		'*/' asParser,
		language ==> [ :x | x first, x last ].
	^language parse:  sourceString