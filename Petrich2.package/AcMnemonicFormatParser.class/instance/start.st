grammar
start
	"The result of parsing a format string is a 1-argument block which,
	 given an ordered collection of operand values,
	 answers a string of disassembly."
	| normal escape |
	normal := (PPPredicateObjectParser anyExceptAnyOf: '%\"') ==> [ :char |
		[ :env :stream | stream nextPut: char ] ].
	escape := '\%' asParser ==> [ :x | [ :y :stream | stream nextPut: $% ]].
	^ (normal / escape / percentId) star end ==> [ :blocks |
		"An array of 2-argument blocks, each block takes (1) an ordered collection
		 of operand values and (2) a stream onto which to print the piece of
		 disassembly corresponding to this element of the array."
		[  :env |
		| stream |
		stream := WriteStream on: String new.
		blocks do: [ :block | block value: env value: stream ].
		stream contents ]]