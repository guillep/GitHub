accessing - branches
arrayOfBranches
	^ self
		putMapping: [ :mapping | mapping listOfElementSchema: GHBranch ]
		ifAbsentAt: #ArrayOfBranches