accessing
at: regName put: v 
	"Here, addr is a concrete Integer"
	| vv |
	vv := v asBitVector: 32.
	super at: regName put: vv