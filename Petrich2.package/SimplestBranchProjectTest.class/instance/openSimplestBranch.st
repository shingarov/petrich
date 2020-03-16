test mock
openSimplestBranch
	| proj |
	proj := GenericPyObject
		create: 'angr.Project'
		constructorSequentialArgs: #('/Users/boris/lamya/simplest_branch').
	self assert: proj pyClass name equals: 'Project'.
	^proj