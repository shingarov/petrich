tests
testPPC42stepState 
	| proj entry factory specialSimulationState simgr successors successorState regs |
	proj := GenericPyObject
		create: 'angr.Project'
		constructorSequentialArgs: #('/Users/boris/ppc42').
	self assert: proj pyClass name equals: 'Project'.
	entry := proj at: 'entry'.
	factory := proj at: 'factory'.
	specialSimulationState := factory entry_state.
	self assert: (specialSimulationState memory load: 4097<<16 + 160) equals: 16r48656C6C.
	
	simgr := GenericPyObject
		create: 'angr.sim_manager.SimulationManager'
		constructorNamedArgs:
			'project' -> proj, "cant live without it"
			('active_states' -> (Array with: specialSimulationState)).

	successors := simgr step_state: ('num_inst' -> 1), ('state' -> specialSimulationState). "li r3, 42"
	
	"the result is a Dictionary of successor state categorization."
	self assert: (successors at: 'unconstrained') isArray.
	self assert: (successors at: 'unconstrained') isEmpty.
	self assert: (successors at: 'unsat') isArray.
	self assert: (successors at: 'unsat') isEmpty.
	self assert: (successors at: nil) isArray.
	self assert: (successors at: nil) size equals: 1.
	
	successorState := (successors at: nil) first.
	regs := successorState @'regs'.
	self assert: regs @'pc' equals: entry + 4.
	self assert: regs @'gpr3' equals: 42.
	
	
	
