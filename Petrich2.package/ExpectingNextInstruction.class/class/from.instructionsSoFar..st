as yet unclassified
from: aReadStream instructionsSoFar: aDictionary 
	^self new 
		readStream: aReadStream;
		instructionDictionary: aDictionary;
		yourself 