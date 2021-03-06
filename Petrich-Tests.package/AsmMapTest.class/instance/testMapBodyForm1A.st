tests
testMapBodyForm1A
	" STR symbollist = int,
	where symbollist is empty (i.e. single id on the left)"
	| result map mapbodylist |
	result := self parseStatement: 'ac_asm_map m { "x" = 123; }'.
	self assert: result key equals: 'ac_map'.
	map := result value.
	self assert: map key equals: 'm'.
	mapbodylist := map value.
	self assert: (mapbodylist at: 123) equals: 'x'