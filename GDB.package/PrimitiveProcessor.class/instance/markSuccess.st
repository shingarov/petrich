engine
markSuccess
	| cr |
	cr := regs at: 'cr'.
	cr := cr bitAnd: (2r0010 << (4 * 2)) bitInvert32. "EQ bit in CR5"
	regs at: 'cr' put: cr