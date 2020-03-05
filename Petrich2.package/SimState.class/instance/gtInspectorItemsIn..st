GT
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 30>
	^ (composite fastTable)
		title: 'Registers';
		display: [ (self @'regs') associations ];
		column: 'Reg' evaluated: #key;
		column: 'Value' evaluated: #value;
		beSingle;
		send: [ :selection | 
			selection isNil 
			ifTrue:[nil]
			ifFalse:[ self regs at: selection key ]]