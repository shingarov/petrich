grammar
defineReserved
	^'define reserved registers as' asParser trim,
	'(' asParser trim,
	registerListSpaceSeparated,
	');' asParser ==>
	[ :x | #reservedRegs: -> x third ]