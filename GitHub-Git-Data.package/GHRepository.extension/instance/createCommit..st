*GitHub-Git-Data-operations
createCommit: aCommit

	^ self
		post: self gitCommitsBaseUrl jsonContent: aCommit;
		responseAs: GHGitCommit