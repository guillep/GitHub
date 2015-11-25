*GitHub-Repositories-accessing
repositories
	^ (NeoJSONReader on: (GitHub client get: self repositoriesUrl) readStream)
		for: #ArrayOfRepos customDo: [ :mapping |
			mapping listOfElementSchema: GHRepository ];
		nextAs: #ArrayOfRepos