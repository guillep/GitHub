accessing
head: aGHCommit

	head := aGHCommit.
	fileTreeRepo := GitHubFileTreeRepository new
		initializeWithRepository: self gitHubRepository
		branch: aGHCommit sha.
	fileTreeRepo allPackageNames do: [ :packageName | | wc |
		wc := MCWorkingCopy forPackage: (MCPackage named: packageName).
		wc repositoryGroup addRepository: fileTreeRepo ].