RSP
getTLB
	| answer |
	answer := self q: '.'.
	^Dictionary newFromAssociations:
	(((answer substrings: ';')
	collect: [ :s | s substrings: ':' ])
	collect: [ :pair | (Integer readFrom: pair first base: 16) -> (Integer readFrom: pair last base: 16) ])