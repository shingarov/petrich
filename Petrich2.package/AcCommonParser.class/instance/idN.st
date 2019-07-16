grammar
idN
	"Example: Op1 parses as #('Op' 1), but Spec parses as #('Spec' nil)"
	^#letter asParser star flatten, decimalNumber optional