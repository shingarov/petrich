RSP commands
c
	" Continue. "
	| answer |
	answer := self q: 'c'.  "NB: on some platforms, we have wanted 'vCont;c'.  I forgot why."
	answer = 'S05' ifFalse: [
		answer isEmpty ifTrue: [ self error: 'Empty answer from GDB server' ].
		answer first = $T ifFalse: [self error: answer] ]