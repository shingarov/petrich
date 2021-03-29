tests
exampleNodes
	| proj startSymbol startState rebasedAddr cfg graph |
	proj := self readElf.
	startSymbol := proj @'loader' @'main_object' get_symbol:'_start'.
	rebasedAddr := startSymbol @'rebased_addr'.
	startState := proj @'factory' blank_state: ('addr' -> rebasedAddr).
	cfg := proj @'analyses' CFGEmulated:
		('starts' -> (Array with: rebasedAddr)),
		('initial_state' -> startState).
	graph := cfg @'graph'.
	^graph allNodes