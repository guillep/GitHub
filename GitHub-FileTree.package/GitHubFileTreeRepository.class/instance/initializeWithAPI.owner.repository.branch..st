initialization
initializeWithAPI: aGitHubAPI owner: aUsername repository: aRepositoryname branch: aBranchNameOrEmptyOrNil

	| ghRepository |
	ghRepository := (aGitHubAPI user: aUsername) repository: aRepositoryname.
	self
		initializeWithRepository: ghRepository
		branch: aBranchNameOrEmptyOrNil