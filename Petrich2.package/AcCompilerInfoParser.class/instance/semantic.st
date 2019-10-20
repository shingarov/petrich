grammar-semantics
semantic
	"The semantic forest of an instruction.
	Parses into 'semantic'->(instructionName->InstructionSemantic(ArrayOfSemanticTrees, cost, hasDelaySlot)).
	"
	^'define instruction ' asParser,
	id,
	' semantic as (' asParser,
	(semanticTree trim ==> [ :x | AccGenInstructionSemanticTree let: x first in: x second ]) star,
	')' asParser trim,
	'cost' asParser trim,
	number,
	', has_delay_slot' asParser optional,
	';' asParser
	==> [ :x | 'semantic' -> (x second -> (AccGenInstructionSemantic  
		trees: x fourth
		cost: x seventh
		hasDelaySlot: (x at: 8) notNil
	))]