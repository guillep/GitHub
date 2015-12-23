*GitHub-Pull-Requests-converting
asPullRequest

	self isPullRequest ifFalse: [ GHNotAPullRequestError signal ].
	^ self
		get: (pull_request at: 'url');
		responseAs: GHPullRequest