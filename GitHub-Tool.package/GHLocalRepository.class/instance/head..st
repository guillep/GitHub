accessing
head: aShaOrBranch

	head := aShaOrBranch.
	fileTreeRepo := GitHubFileTreeRepository new
		initializeWithRepository: self gitHubRepository
		branch: aShaOrBranch.
	fileTreeRepo allPackageNames do: [ :packageName | | wc |
		wc := MCWorkingCopy forPackage: (MCPackage named: packageName).
		wc repositoryGroup addRepository: fileTreeRepo ].