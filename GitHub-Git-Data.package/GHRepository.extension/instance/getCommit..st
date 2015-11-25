*GitHub-Git-Data-accessing
getCommit: aSHA

	^ self get: self commitsBaseUrl / aSHA decodedAs: GHGitCommit