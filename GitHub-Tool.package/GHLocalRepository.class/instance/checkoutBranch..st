checkout
checkoutBranch: aBranchString

	self head: aBranchString.
	fileTreeRepo := GitHubFileTreeRepository new
		initializeWithRepository: self gitHubRepository
		branch: self head.
	self load