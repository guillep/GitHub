accessing
repositoryAt: aRepositoryName ifAbsent: absentBlock

	^ self repositoryNamesToRepositories
		at: aRepositoryName
		ifAbsent: absentBlock