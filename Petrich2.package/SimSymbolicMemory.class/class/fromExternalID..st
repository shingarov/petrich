private
fromExternalID: anExternalID 
	| cat concreteClass |
	cat := self categoryOf: anExternalID.
	"only mem and reg exist, so the following should be safe"
	concreteClass := cat='reg' ifTrue: [ SymbolicRegisterFile ] ifFalse: [ SymbolicRAM ].
	^concreteClass var: anExternalID