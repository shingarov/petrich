grammar
hexNumber
	^('0x' asParser , (#hex asParser plus flatten ))  ==> [ :x | Integer readFrom: x last base: 16  ]