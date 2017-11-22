grammar
start
	"
	(SInvParser pdl: AcProcessorDescriptions powerpc) parse:
	SWIProlog new solveS
	"
	^idiom star ==> [ :assocs | Dictionary newFromAssociations: assocs ]