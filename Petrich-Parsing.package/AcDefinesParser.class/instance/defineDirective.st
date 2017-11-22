as yet unclassified
defineDirective
	^'#define' asParser trim,
	id trim,
	self class newline negate star flatten,
	self class newline
	==> [ :x | x second -> x third ]
