testing
isRepositoryLoaded: aRepositoryName

	^ self repositoryNamesToRepositories
		includesKey: aRepositoryName