grammar
hexNumber
	^'0x' asParser , #hex asParser star flatten ==> [ :x | Integer readFrom: x second base: 16 ]