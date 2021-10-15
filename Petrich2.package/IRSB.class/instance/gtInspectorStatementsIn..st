GT
gtInspectorStatementsIn: composite
	<gtInspectorPresentationOrder: 25>
	^ composite fastList
		title: 'Statements';
		display: [ self statements ]