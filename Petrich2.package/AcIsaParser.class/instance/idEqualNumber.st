grammar
idEqualNumber
	^id , $= asParser trim, number
	==> [ :x | Association key: x first value: x last ]