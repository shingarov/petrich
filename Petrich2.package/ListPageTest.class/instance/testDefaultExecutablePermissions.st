tests
testDefaultExecutablePermissions
	| page |
	page := RAMPage startAddr: 100 size: 4 executable: true.
	self assert: page @'concrete_permissions' equals: 7 "RWX"