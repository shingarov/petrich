idioms
nextPutIdiom: idName op1: op1 op2: op2
	| instructions |
	instructions := [ self isel emitIdiom: idName with: op1 asInteger with: op2 asInteger ]
		on: UnknownFutureException 
		do: [ :ex | 
				| newStream |
				newStream := TargetAgnosticInstructionStream copyFrom: self.
				ex operand patchAction: [ newStream
					nextPutIdiom: idName
					op1: op1 asInteger op2: op2 asInteger ].
				ex resume ].
	instructions do: [ :i | self nextPutInstruction: i ]