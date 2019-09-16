object access primitives
primCharacterBasicAt
	| index char |
	index := self getVRegister: #A.
	"Guard that the arg is an SI:"
	(index bitAnd: 2r00011) = 1 ifFalse: [ ^self markFail ].
	index := index >> 4.
	
	char := gdb readByteAt: (self getVRegister: #R) + 8 + index - 1.
	
	"CHAR_TAG=2"
	char := char << 4 bitOr: 2.
	
	self return: char