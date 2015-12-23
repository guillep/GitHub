*GitHub-Issues-accessing
issueByNumber: anIntegerOrString

	^ self
		get: self issuesBaseUrl / anIntegerOrString asString;
		responseAs: GHIssue