idioms
nextPutIdiom: idName op1: op1 op2: op2 op3: op3 op4: op4 op5: op5
	| instructions |
	instructions := self isel emitIdiom: idName with: op1 with: op2 with: op3 with: op4 with: op5.
	instructions do: [ :i | self nextPutInstruction: i ]