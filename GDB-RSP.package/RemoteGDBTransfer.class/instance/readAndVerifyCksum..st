private
readAndVerifyCksum: anInteger
	"Read next two characters from the TCP stream and verify that they represent the same hext number as anInteger."
	| cksumFromServer |

	cksumFromServer := Integer
		readFrom: (String with: self receiveByte with: self receiveByte)
		radix: 16.
	"cksumFromServer = anInteger ifFalse: [ self error: 'Wrong checksum' ]"