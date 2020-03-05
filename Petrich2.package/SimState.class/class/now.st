instance creation
now
	| c |
	c := thisContext findContextSuchThat:
		[ :aContext | aContext hasTemporaryVariableNamed: 'specialSimulationState' ].
	c isNil ifTrue: [ ^nil ].
	^c tempNamed: 'specialSimulationState'
