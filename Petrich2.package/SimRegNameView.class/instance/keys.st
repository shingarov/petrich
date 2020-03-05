accessing
keys
	"SimRegNameView.__dir__() contains non-orthogonal black magic:
	it checks for arch name and does special things on X86, AMD64 and arm."
	^(#('X86' 'AMD64') includes: self @ 'state' @ 'arch' @ 'name')
		ifTrue: [ self __dir__ ]
		ifFalse: [ P compute: 'list(', self ref, '.__dir__())' ]