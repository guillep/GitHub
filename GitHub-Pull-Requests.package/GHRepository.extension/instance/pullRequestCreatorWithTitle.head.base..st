*GitHub-Pull-Requests-operations
pullRequestCreatorWithTitle: aString head: headBranchString base: baseBranchString
	" headBranchString can be a branch on a fork of the repository
	  this issue is on. Specify this using username:branch. "
	^ GHPullRequestCreator
		on: self
		withTitle: aString
		fromHead: headBranchString
		toBase: baseBranchString