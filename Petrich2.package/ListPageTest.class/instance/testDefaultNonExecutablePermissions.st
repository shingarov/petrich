tests
testDefaultNonExecutablePermissions
	| page |
	page := RAMPage startAddr: 100 size: 4 executable: false.
	self assert: page @'concrete_permissions' equals: 3 "RW-"