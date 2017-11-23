engine
processPrimitive: primitiveSelector
	self
		getAllRegisters;
		perform: primitiveSelector;
		advancePastTrap;
		setAllRegisters