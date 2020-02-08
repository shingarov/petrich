tests
testPPC42manualSimMgr 
	| proj entry factory specialSimulationState simgr stepResult regs |
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

	stepResult := simgr step: 'num_inst' -> 1. "li r3, 42"
	"the result is another SimulationManager"
	regs := (stepResult @'active') first @'regs'.
	self assert: regs @'pc' equals: entry + 4.
	self assert: regs @'gpr3' equals: 42.
	
	stepResult := stepResult step: 'num_inst' -> 1. "lis r16,4097"
	regs := (stepResult @'active') first @'regs'.
	self assert: regs @'pc' equals: entry + 8.
	self assert: regs @'gpr16' equals: 4097<<16.
	
	stepResult := stepResult step: 'num_inst' -> 1. "ori r16,r16,160"
	regs := (stepResult @'active') first @'regs'.
	self assert: regs @'pc' equals: entry + 12.
	self assert: regs @'gpr16' equals: (4097<<16 + 160).
	
	"now r16 contains &hello and we are ready to load"
	stepResult := stepResult step: 'num_inst' -> 1. "lwz r1,0(r16)"
	regs := (stepResult @'active') first @'regs'.
	self assert: regs @'pc' equals: entry + 16.
	self assert: regs @'gpr1' equals: 16r48656C6C.
	
