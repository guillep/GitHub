accessing - commits
arrayOfCommits
	^ self
		putMapping: [ :mapping | mapping listOfElementSchema: GHCommit ]
		ifAbsentAt: #ArrayOfCommits