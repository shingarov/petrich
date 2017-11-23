magick
advancePastTrap
	| regs |
	regs := self getRegisters.
	regs at: 'pc' put: (regs at: 'pc') + 4.
	self setRegisters: regs.