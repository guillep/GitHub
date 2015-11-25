checkout
checkoutCommit: aGHCommit

	self head: aGHCommit.
	self beDetachedHead.
	self loadBranchOrVersionAtSha: aGHCommit sha