grammar
imm
	^ 'imm:Op' asParser,
	#hex asParser,
	':tgtimm' asParser ==> [ :x |
		ImmediateSemanticOperand new 
			number: ((String with: x second) asInteger);
			yourself ]