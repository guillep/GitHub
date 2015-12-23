*GitHub-Pull-Requests-operations
createPullRequestFromIssue: anIssue fromHead: headString toBase: baseString
	" headBranchString can be a branch on a fork of the repository
	  this issue is on. Specify this using username:branch. "
	^ self
		createPullRequestFromIssueNumber: anIssue number
		fromHead: headString
		toBase: baseString