instance creation
getOrCreateRepositoryForRemote: aGHRepository

	^ self repositoryNamesToRepositories
		at: aGHRepository name
		ifAbsentPut: [ self onRemoteRepository: aGHRepository ]