as yet unclassified
sprNames
	gdb processorDescription architectureName = 'powerpc' 
		ifTrue: [ ^#('pc' 'lr' 'cr' 'ctr' 'msr' 'xer') ].
	^#('pc' 'sr' 'hi' 'lo' 'cause' 'badvaddr')