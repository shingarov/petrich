engine
markFail
	| cr |
self halt.
	cr := regs at: 'cr'.
	cr := cr bitOr: 2r0010 << (4 * 2). "EQ bit in CR5"
	regs at: 'cr' put: cr