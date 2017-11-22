logic - private
printInstructionRewriteRulesOn: aStream
	aStream nextPutAll: '/* INSTRUCTION REWRITING RULES: */'; lf; lf.
	instructions do: [ :instr | instr printLogicOn: aStream ].
		aStream nextPutAll: '/* END OF INSTRUCTION REWRITING RULES */'; lf; lf.
