accessing - branches
arrayOfBranches

	^ self
		at: #ArrayOfBranches
		putIfAbsent: [ :mapping |
			mapping listOfElementSchema: GHBranch
		]