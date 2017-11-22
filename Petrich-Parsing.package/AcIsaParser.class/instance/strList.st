grammar
strList
	^str,
	(($, asParser trim, str) ==> [ :commaStr | commaStr second ]) star
	==> [ :x |
		| initial rest |
		initial := OrderedCollection  with: x first.
		rest := x last.
		initial addAllLast: rest.
		initial
	 ]