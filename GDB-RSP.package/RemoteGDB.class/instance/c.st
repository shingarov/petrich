RSP commands
c
	" Continue. "
	| answer |
	answer := self q: 'c'.  "NB: on some platforms, we have wanted 'vCont;c'.  I forgot why."
	answer isEmpty ifTrue: [ self error: 'Empty answer from GDB server' ].
	answer first = $T ifTrue: [ ^self ].
	answer first = $S ifTrue: [ ^self ].
	self shouldBeImplemented "some unknown answer from GDB"