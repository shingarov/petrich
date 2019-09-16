RSP commands
kill
	| answer |
	answer := self q: 'k'.
	answer = 'OK' ifFalse: [ self error: answer ]
