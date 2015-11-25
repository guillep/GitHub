checkout
checkoutBranch: aGHBranch

	branch := aGHBranch.
	self head: branch commit.
	self loadBranchOrVersionAtSha: branch name.