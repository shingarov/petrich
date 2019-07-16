drawing
drawSemanticTree: anInstructionSemanticTree on: aCanvas y: y
	"Answer how tall it took."
	^anInstructionSemanticTree
		drawOn: aCanvas
		at: self bounds left @ (y+2)