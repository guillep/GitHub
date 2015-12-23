*GitHub-Pull-Requests-operations
createPullRequestFromIssueNumber: anInteger fromHead: headString toBase: baseString
	" headBranchString can be a branch on a fork of the repository
	  this issue is on. Specify this using username:branch. "
	^ self
		post: self pullsBaseUrl jsonContent: (NeoJSONObject new
			at: 'issue' put: anInteger;
			at: 'head' put: headString;
			at: 'base' put: baseString;
			yourself);
		responseAs: GHPullRequest