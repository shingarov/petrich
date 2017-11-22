drawing
drawFieldSeparator: i on: aCanvas
	"Right vertical separator"
	| right |
	i==32 ifTrue: [ ^self ].
	right := self stumpX: i.
	aCanvas
		line: right @ (self bitBox bottom-1)
		to: right  @ (self bitBox top)
		width: 1
		color: (Color black)