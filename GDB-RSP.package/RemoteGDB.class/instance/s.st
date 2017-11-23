RSP commands
s
	"Single step.
	Return control with signal 5 (TRAP)."
	| answer |
	answer := self q: 's'.
	answer first = $S ifTrue: [ ^self ].
	answer first = $T ifTrue: [ ^self ].
	self error: answer
