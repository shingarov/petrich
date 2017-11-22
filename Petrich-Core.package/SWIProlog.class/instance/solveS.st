code generation
solveS
	"Answer the string defining the Dictionary of idioms
	in the SInv Idiom Language.  This string can be fed
	into SInvParser to obtain the idiomName->Block dictionary."
	" SWIProlog new solveS "
	| answer |
	answer := (PipeableOSProcess command: self command) output.
	answer := answer reject: [ :char | char = $_ ].
	^answer