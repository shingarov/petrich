constant width
disassembleableFormFor: code
	(code isInteger and: [ self hasConstantInstructionWidth ]) ifTrue: [ ^code asBitVector: self constantInstructionWidth ].
	^code