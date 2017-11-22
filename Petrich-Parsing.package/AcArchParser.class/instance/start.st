grammar
start
	^processorDescription end
	==> [ :x |
		| components |
		components := x value asOrderedCollection.
		components := components 
			inject: (OrderedCollection with: 'SEMANTICS' -> (AcCompilerInfoParser parseFile: 'compiler_info.ac' in: directory))
			into: [ :soFar :elem | soFar addAll: elem; yourself ].
		AcInstructionSelector new
			architectureName: (x key);
			fillFrom: components;
			yourself ]