grammar
nonEmptyOperands
	^$( asParser,
	operand,
	(($, asParser, operand) ==> [ :x | x second ]) star,
	$) asParser ==> [ :x |
		(OrderedCollection withAll: x third)
			addFirst: (x second);
			yourself
		 ]