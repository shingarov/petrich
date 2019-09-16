object access primitives
primCharacterFromCodePoint
	| arg |
	arg := self getVRegister: #A.
	"Remove the SI tag and attach a CHAR tag"
	arg := (arg bitAnd: 16rFFFFFFF0) bitOr: 2r00010.
	self return: arg