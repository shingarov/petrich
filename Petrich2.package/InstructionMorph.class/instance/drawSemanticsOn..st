drawing
drawSemanticsOn: aCanvas
	| semantics y |
	semantics := instruction semantics.
	"y := self bitBox bottom + 18.
	semantics do: [ :anInstructionSemantic |
		y := y + (self drawSemanticForest: anInstructionSemantic on: aCanvas y: y) ]" "draw lwisem here"