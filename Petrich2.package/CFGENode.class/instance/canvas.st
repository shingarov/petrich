accessing
canvas
	| c font words |
	c := RSCanvas new.
font := LogicalFont familyName: 'Liberation Mono' pointSize: 12.
words := self linesOfDisassembly.
c addAll: (words collect: [:word | 
	RSLabel new
		font: font;
		color: (Color black);
		text: word;
		yourself ]).
RSVerticalLineLayout on: c nodes.
	
c @ RSCanvasController.
^c