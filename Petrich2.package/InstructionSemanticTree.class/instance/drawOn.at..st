drawing
drawOn: aCanvas at: origin
	"Answer how tall it took."
	| sourceHeight |
	sourceHeight := self drawSourceOn: aCanvas at: origin.
	^sourceHeight + (self drawLogicOn: aCanvas at: origin + (0@sourceHeight)).
	