testing
xxx
	" InstructionMorph xxx "
	| morph |
	morph := TextMorph  new.
	morph
contents: 
'blah
this not only
crappy
but evil
as well
and
as hell';
fontName: 'Bitmap DejaVu Sans' pointSize: 14;
backgroundColor: (Color white);
wrapFlag: true;
halt;
bounds: (0@0 corner: 1000@500);
enabled: true;
autoFit: true.
^morph