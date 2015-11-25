loading
loadBranchOrVersionAtSha: aBranchOrShaString

	fileTreeRepo := GitHubFileTreeRepository new
		initializeWithRepository: self gitHubRepository
		branch: aBranchOrShaString.
	fileTreeRepo allPackageNames do: [ :packageName | | wc |
		wc := MCWorkingCopy forPackage: (MCPackage named: packageName).
		wc repositoryGroup addRepository: fileTreeRepo
	].
	self load