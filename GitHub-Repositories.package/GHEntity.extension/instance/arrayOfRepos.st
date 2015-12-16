*GitHub-Repositories-accessing
arrayOfRepos
	^ self
		putMapping: [ :mapping | mapping listOfElementSchema: GHRepository ]
		ifAbsentAt: #ArrayOfRepos