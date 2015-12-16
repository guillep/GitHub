operations
deleteContentWithMessage: aCommitMessage
	| result |
	result := self
		delete: self url jsonContent: (NeoJSONObject new
			message: aCommitMessage;
			sha: self sha;
			yourself);
		responseAs: self nullAndCommitPair.
	^ result at: #commit.