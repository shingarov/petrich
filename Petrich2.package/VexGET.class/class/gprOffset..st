instance creation
gprOffset: off
	| ref |
	ref := 'pyvex.expr.Get(', off printString, ', "Ity_I32")'.
	^P compute: ref