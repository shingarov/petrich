grammar
defineAuxiliar
	^'define auxiliar registers as' asParser trim,
	'(' asParser trim,
	registerListSpaceSeparated,
	');' asParser ==>
	[ :x | #auxRegs: -> x third ]