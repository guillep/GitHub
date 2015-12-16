*GitHub-Git-Data-accessing
getCommit: aSHA

	^ self
		get: self gitCommitsBaseUrl / aSHA;
		responseAs: GHGitCommit