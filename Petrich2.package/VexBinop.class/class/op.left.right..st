instance creation
op: aString left: l right: r 
	| ref |
	ref := 'Binop(''', aString, ''', [ ', l ref, ', ', r ref, ' ] )'.
	^P compute: ref