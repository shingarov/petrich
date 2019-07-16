logic - private
printGoGoal: anAbstractTerm on: aStream
	aStream nextPutAll: 'go :- Abstract = ';
	nextPutAll: anAbstractTerm;
	nextPutAll: ',
emit(Abstract, X),
print(X).
' copyReplacingCRtoLF 