execution
process: aSimState irsb: anIRSB
	^P compute:
		self ref,
		'.process( ',
		aSimState ref,
		', ', 
		anIRSB ref,
		' ).flat_successors[0]' "NB BOGUS -- for now we are not interested in branching, but in general there are many successors!"