tests
testMapBodyForm1B
	" STR symbollist = int,
	where symbollist is non-empty (i.e. many ids on the left)"
	| result map mapbodylist |
	result := self parseStatement: 'ac_asm_map m { "x" = 123; }'.
	self assert: result key equals: 'ac_map'.
	map := result value.
	self assert: map key equals: 'm'.
	mapbodylist := map value.
		self halt. "What happens here is totally bogus: Y is discarded!"