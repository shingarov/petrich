private
arch: arch types: types
	"This is a bit different to everything we are doing in SmallGrind.
	While normally we do (or intend to do) our own stuff, calling
	external library when Smalltalk still misses something,
	here we are causing a VEX translation *intentionally*."
	| args |
	args := (Dictionary new)
		at: 'arch'       put: arch;
		at: 'types'      put: types;
		yourself.
	^GenericPyObject create: 'block.IRTypeEnv' constructorNamedArgs: args

