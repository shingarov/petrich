grammar
convType
	"Either calling or return;
	answer whether it's return (i.e. same is in AcCallingConvention>>#isReturn:"
	^'return' asParser trim ==> [ :x | true ]  /
	'calling' asParser trim ==> [ :x | false ]