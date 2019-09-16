instance creation
expr: e gprOffset: o
	^self construct: 'pyvex.stmt.Put( ', e ref, ', ', o printString, ' )'