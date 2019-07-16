grammar
str
	| begin end any expression inside  |
	begin := '"' asParser.
	end := '"' asParser.
	any := #any asParser.
	expression := PPDelegateParser new.
	inside := end not, ( expression / any ).
	expression setParser: begin, inside star flatten, end flatten.
	^expression ==> [ :x | x second ]