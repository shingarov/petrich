tests
testCreateTypeEnv
	| arch ty |
	arch := ArchInfo arch: 'powerpc'.
	ty := IRTypeEnv arch: arch types: #('Ity_I32' 'Ity_I32').
	self assert: ty __str__ equals: 't0:Ity_I32 t1:Ity_I32'.
	self assert: (ty lookup: 0) equals: 'Ity_I32'.
	self assert: (ty sizeof: 0) equals: 32.
	self assert: (ty @'types_used') equals: 2.
	ty add: 'Ity_32'.
	self assert: (ty @'types_used') equals: 3.
	self assert: (ty @'wordty') equals: 'Ity_I32'.