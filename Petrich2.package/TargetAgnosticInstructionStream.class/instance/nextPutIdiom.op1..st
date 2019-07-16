idioms
nextPutIdiom: idName op1: op1
	| instructions |
	instructions := [ self isel emitIdiom: idName with: op1 asInteger ]
		on: UnknownFutureException 
		do: [ :ex | 
				| newStream |
				newStream := TargetAgnosticInstructionStream copyFrom: self.
				op1 patchAction: [ newStream nextPutIdiom: idName op1: op1 asInteger ].
				ex resume ].
	instructions do: [ :i | self nextPutInstruction: i ]