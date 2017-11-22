instruction encoding
assertWidth
	| width |
	width := bitFields
		inject: 0
		into: [ :current :bitFieldAssoc | current + bitFieldAssoc value abs ]