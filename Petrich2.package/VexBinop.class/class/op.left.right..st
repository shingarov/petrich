instance creation
op: aString left: l right: r 
	| ref |
	ref := 'pyvex.expr.Binop(''', aString, ''', [ ', l ref, ', ', r ref, ' ] )'.
	^P compute: ref