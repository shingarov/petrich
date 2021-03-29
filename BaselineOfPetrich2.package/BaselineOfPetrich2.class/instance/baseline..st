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
			spec baseline: 'PyGate' with: [
				spec repository: 'github://shingarov/PyGate:ghost'].
			spec baseline: 'MachineArithmetic' with: [
				spec repository: 'github://shingarov/MachineArithmetic:refactor_z3'].
			spec baseline: 'ArchC' with: [
				spec repository: 'github://shingarov/Pharo-ArchC:master'].
			
			spec
				package: #'Petrich2'
		]