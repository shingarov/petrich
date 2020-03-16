tests
testNotEqualsIRSB
	| proj factory block statements |
	proj := self openSimplestBranch.
	startAddr := proj at: 'entry'.
	factory := proj at: 'factory'.
	block := factory block: 16r10000064.
	statements := block @'vex' @'statements'.
	"IMARK"
	self assert: (statements first isKindOf: VexIMark).
	"VexPUT"
	self assert: (statements second isKindOf: VexPUT).