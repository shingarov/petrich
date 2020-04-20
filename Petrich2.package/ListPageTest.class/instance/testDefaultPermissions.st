tests
testDefaultPermissions
	| page |
	page := RAMPage startAddr: 10000 size: 32.
	self assert: page @'concrete_permissions' equals: 3 "RW"