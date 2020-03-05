GT
gtInspectorItemsIn: composite
	^ (composite fastTable)
		title: 'All backers';
		display: [ self allBackers associations ];
		column: 'Address' 
			evaluated: [:each | GTObjectPrinter asTruncatedTextFrom: each key ];
		column: 'Bytes' 
			evaluated: [:each | GTObjectPrinter asTruncatedTextFrom: each value ];
		selectionPopulate: #selection 
			entitled: 'Open key'
			with: [ :table | (table rawSelection collect: #key) gtInspectorInterestingObject ];
		beSingle;
		send: [ :selection | 
			selection isNil 
			ifTrue:[nil]
			ifFalse:[ (selection size = 1) 
				ifTrue: [ selection anyOne value ] 
				ifFalse: [ selection collect: #value ] ]]
		