drawing
drawSemanticForest: anInstructionSemantic on: aCanvas y: y
	"Answer how tall it took."
	| height |
	self
		drawCost: anInstructionSemantic cost
		on: aCanvas
		y: y
		hasDelaySlot: anInstructionSemantic hasDelaySlot.

	aCanvas
		"line"
		line: self bitBox left @ y
		to: self bitBox right @ y
		width: 1
		color: (Color red).
	height := 0.
	anInstructionSemantic trees do: [ :semTree |
		height := height + (self drawSemanticTree: semTree on: aCanvas y: y+height) ].
	^22 max: height + 3
