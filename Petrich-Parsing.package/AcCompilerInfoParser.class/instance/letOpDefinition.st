grammar-semantics
letOpDefinition
	^idN trim,
	$= asParser trim,
	$" asParser,
	$" asParser negate star flatten,
	$" asParser ==> [ :x | x first second -> x fourth ]