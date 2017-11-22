grammar
abi
	^'define abi as (' asParser,
	abiDefinition trim star,
	');' asParser trim
	==> [ :x |
		| definitions abiObject |
		abiObject := AcABI new.
		definitions := x second.
		definitions do: [ :ass | abiObject perform: ass key with: ass value ].
		abiObject ]