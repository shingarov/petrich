grammar
defineCalleeSave
	^'define callee save registers as' asParser trim,
	'(' asParser trim,
	registerListSpaceSeparated,
	');' asParser ==>
	[ :x | #calleeSaveRegs: -> x third ]