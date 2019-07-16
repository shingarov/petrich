grammar
doubleQuoted
	$" asParser, $" asParser negate star flatten, $" asParser 
		==> [ :x | x second ]