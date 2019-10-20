instance creation
gprOffset: off
	| ref |
	ref := 'Get(', off printString, ', "Ity_I32")'.
	^P compute: ref