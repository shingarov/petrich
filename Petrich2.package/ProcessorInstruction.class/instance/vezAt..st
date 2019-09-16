VEX
vezAt: addr
	"Answer a VEZ IRSB starting at address addr."
	
	"   ***  THIS IS CRAP!!!  ***   "
	self name = 'addis' ifTrue: [ ^self vezAddisAt: addr ].
	self name = 'ori'   ifTrue: [ ^self vezOriAt: addr ].
	self shouldBeImplemented "...by parsing PDL"
	