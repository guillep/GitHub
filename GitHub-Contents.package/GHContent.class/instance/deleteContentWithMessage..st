operations
deleteContentWithMessage: aCommitMessage

	^ self delete: self url jsonContent: (NeoJSONObject new
		message: aCommitMessage;
		sha: self sha;
		yourself)