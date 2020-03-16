tests
playWithIRSB: anIRSB
	| statements exits |
	self halt. 
	statements := anIRSB @'statements'.
	exits := anIRSB @'exit_statements'.
	