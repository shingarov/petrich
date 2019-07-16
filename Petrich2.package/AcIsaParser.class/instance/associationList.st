as yet unclassified
associationList
	^ idEqualNumber,
	(($, asParser trim, idEqualNumber ==> [ :x | x second ]) star
		==> [ :x | self associations2dictionary: x ])
	==> [ :x | x second add: (x first); yourself ]