private
gtInspectorPreviewIn: composite
	<gtInspectorPresentationOrder: 20>
	composite morph
		title: 'Registers';
		morph: [ GdbRegistersMorph on: self ]