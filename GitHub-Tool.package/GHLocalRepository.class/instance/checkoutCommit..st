checkout
checkoutCommit: aGHCommit

	self head: aGHCommit.
	self beDetachedHead.
	self load