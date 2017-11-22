private
parsedElementsNamed: key from: aCollectionOfAssociations
	^(aCollectionOfAssociations select: [ :ass | ass key = key ]) collect: [ :ass | ass value ]
