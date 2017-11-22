as yet unclassified
associations2dictionary: associations
	| d |
	d := Dictionary new.
	associations  do: [ :anAssociation | d add: anAssociation  ].
	^d