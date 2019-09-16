instance creation
t: tmpNo expr: aVexIRExpr
	^self construct: 'pyvex.stmt.WrTmp( ', tmpNo printString, ', ', aVexIRExpr ref, ' )'