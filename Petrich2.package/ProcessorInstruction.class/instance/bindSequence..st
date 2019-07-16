emitting
bindSequence: seq
	"The operands of an instruction are ordered.
	Answer a GroundedProcessorInstruction whose first operand is bound to (seq first), and so on."
	| allFields operandFields env |
self shouldBeImplemented.
	allFields := format bitFields.
	operandFields := allFields reject: [ :ass | internalBindings includesKey: ass key ].
	operandFields := operandFields reject: [ :ass | ass key isInteger ].
	seq size == operandFields size ifFalse: [
		self error: 'Instruction ', name, ' takes ', operandFields size, ' operands but we are given ', seq size printString  ].
	env := Dictionary new.
	operandFields doWithIndex: [ :field :i |
		| operandValue |
		operandValue := seq at: i.
		"operandValue < (1<<field value abs) ifFalse: [ self halt; error: 'Operand value ', operandValue printString, ' does not fit in ', field value printString, ' bits' ]."
		env at: field key put: operandValue.
		 ].
	^self bind: env