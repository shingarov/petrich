tests
testEmitAndRunLoadIConst
	| buildTarget dummyProject builder |
	buildTarget := MTBuildTarget new.
	buildTarget setTajRuntime. "this creates a MTTAJRuntime"
	
	dummyProject := Project new.
	dummyProject selectedTarget: buildTarget.
	
	builder := TargetBuilder project: dummyProject.
	"at this point, the builder has connected to gdb,
	and started the thin shell;
	execution is frozen just before the jump to the nZone"
	
	self emitAndRunLoadIConst: builder