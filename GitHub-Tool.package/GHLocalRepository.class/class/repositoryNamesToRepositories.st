accessing
repositoryNamesToRepositories

	^ RepoNamesToRepo ifNil: [ RepoNamesToRepo := Dictionary new ]