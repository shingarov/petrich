grammar
helper
	^'ac_helper {' asParser trim,
	'};' asParser negate star,
	'};' asParser
	==> [ :x | #() ]