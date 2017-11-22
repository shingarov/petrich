binary emission
assembleBinary: instrCollection
	^instrCollection collect: [ :instr | instr emit ]