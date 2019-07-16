grammar
start
	"
	(RewriteResultParser pdl: AcProcessorDescriptions mips) parse: '[addu(gpr(1),gpr(20),gpr(5))]'
	"
	^$[ asParser trim,
	instruction,
	($, asParser , instruction) star,
	$] asParser trim ==> [ :x |
		(OrderedCollection withAll: (x third collect: [ :nextInstr | nextInstr second ]))
		addFirst: (x second); yourself ]