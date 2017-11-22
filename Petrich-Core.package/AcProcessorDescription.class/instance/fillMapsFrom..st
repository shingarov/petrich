collaboration with parser
fillMapsFrom: aCollectionOfAssociations
	| mapAssociations |
	mapAssociations := aCollectionOfAssociations select: [ :ass |
		ass key = 'ac_map'].
	mapAssociations := mapAssociations collect: [ :ass | ass value ].
	maps := Dictionary newFromAssociations: mapAssociations