Extension { #name : #SystemOrganizer }

{ #category : #'*Petrich-DUI' }
SystemOrganizer >> beeOutCategory: category on: stream [ 
	| classes bee |
	bee := Pharo2beeClassFileout new
		stream: stream;
		author: 'B Shingarov';
		project: category;
		yourself.
	classes := self superclassOrder: category.
	classes do: [:each | bee fileOut: each ]
		separatedBy: [ stream
			cr; lf; cr; lf ].
"	classes do: [:cls | cls beeOutInitializerOn: stream ]."
	FileStream writeSourceCodeFrom: stream baseName: category isSt: true
]
