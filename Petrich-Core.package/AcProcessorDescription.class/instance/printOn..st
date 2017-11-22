printing
printOn: aStream 
	aStream nextPutAll: 'AC_ARCH(', self architectureName, ')'