object access primitives
primCharacterBasicAtPut
	| index char charOop |

	index := self getVRegister: #A.
	"Guard that the index arg is an SI"
	(index bitAnd: 2r00011) = 1 ifFalse: [ ^self markFail ].
	index := index >> 4.
	
	charOop := self currentFrame arg: 2.
	"Guard that the char arg is a char"
	(charOop bitAnd: 2r00011) = 2 ifFalse: [ ^self markFail ].
	char := charOop >> 4.
	
	gdb writeByte: char toAddr: (self getVRegister: #R) + 8 + index - 1.
	
	self return: charOop