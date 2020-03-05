operations
permissionsAt: addr
	"Here, addr is a concrete Integer"
	^P compute: self ref, '.permissions(', addr printString, ')'