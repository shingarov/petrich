grammar
pseudoInstr
	"Pseudo instructions are only useful constructing the assembler"
	^'pseudo_instr' asParser trim,
	matchedParen,
	${ asParser trim,
	pseudoInstrConstituent trim star,
	$} asParser
	==> [ :x | 'pseudo_instr' -> #BOGUS ]