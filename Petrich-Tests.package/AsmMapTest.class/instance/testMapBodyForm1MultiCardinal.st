tests
testMapBodyForm1MultiCardinal
	"two definitions for the same key"
	| result |
	result := self parseStatement: 'ac_asm_map m { "x", "y" = 1; "x" = 2; }'.
		self halt. "BOGUS, need to understand what should happen here."