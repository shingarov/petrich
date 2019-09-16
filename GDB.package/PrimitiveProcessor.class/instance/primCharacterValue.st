object access primitives
primCharacterValue
	| arg |
	arg := self getVRegister: #A.
	"Remove the CHAR tag and attach a SI tag"
	arg := (arg bitAnd: 16rFFFFFFF0) bitOr: 2r00001.
	self return: arg