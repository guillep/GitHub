*GitHub-Issues-accessing
issueByNumber: anIntegerOrString

	^ self
		get: self issuesBaseUrl;
		responseAs: GHIssue