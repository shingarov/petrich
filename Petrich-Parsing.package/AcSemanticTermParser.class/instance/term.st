grammar
term
	^ $( asParser trim,
	functor trim,
	arg trim star,
	$) asParser trim ==> [ :x |
		SemanticTerm new
			functor: x second;
			args: x third;
			yourself ]