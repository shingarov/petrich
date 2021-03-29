baselines
baseline: spec
	<baseline>
	spec 
		for: #pharo
		do: [
			spec baseline: 'PetitParser' with: [
				spec loads: 'Core'.
				spec loads: 'Analyzer'.
				spec repository: 'github://shingarov/PetitParser:ULD'].
			spec
				package: #'Petrich2'
		]