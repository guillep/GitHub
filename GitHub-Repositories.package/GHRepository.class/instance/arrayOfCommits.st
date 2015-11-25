accessing - commits
arrayOfCommits

	^ self
		at: #ArrayOfCommits
		putIfAbsent: [ :mapping |
			mapping listOfElementSchema: GHCommit
		]