*GitHub-Pull-Requests-accessing
pullRequestByNumber: anInteger

	^ self
		get: self pullsBaseUrl / anInteger asString;
		responseAs: GHPullRequest