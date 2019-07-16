grammar
imm
	^ '%imm' asParser / '%exp' asParser / '%addr' asParser ==> [ :immToken |
		[ :operands :stream |
			stream nextPutAll: '0x'.
			operands removeFirst printOn: stream base: 16 showRadix: false]]