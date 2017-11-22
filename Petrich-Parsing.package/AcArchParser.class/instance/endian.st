grammar
endian
	^('set_endian("little");' asParser ==> [ :x | 'endian' -> #little ]) /
	('set_endian("big");' asParser ==> [ :x | 'endian' -> #big ])
