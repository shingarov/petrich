access
semantics
	semantics isNil ifTrue: [
		"This is needed even though the instance is created
		eagerly during DSL parsing.  This is a dirty hack."
		semantics := LwInstructionSemantics instruction: self.
		^semantics  ].
	^semantics copy
		instruction: self;
		yourself 