parsing
parseString: s
	^self processXML: (PPXmlParser parse: s) rootElement 
