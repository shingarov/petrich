accessing
widthOf: fieldName
	^(Dictionary newFromAssociations: self bitFields) at: fieldName 