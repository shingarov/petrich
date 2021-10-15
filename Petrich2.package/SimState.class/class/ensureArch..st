instance creation
ensureArch: archName
	"self now ifNotNil: [ :simStateNow | ^simStateNow ]."
	"Nothing in the caller chain, return a new one"
	
	"no no no.  don't.  create a project, and ask the factory for an empty_state.
	but we need a memory for that, and we will only know that after.
	and then they create multiple memories.  damn."
	self flag: 'no no no'.
	"self shouldBeImplemented ."
	^self arch: archName