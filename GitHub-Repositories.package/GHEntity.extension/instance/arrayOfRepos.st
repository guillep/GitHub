*GitHub-Repositories-accessing
arrayOfRepos

	^ self
		at: #ArrayOfRepos
		putIfAbsent: [ :mapping |
			mapping listOfElementSchema: GHRepository
		]