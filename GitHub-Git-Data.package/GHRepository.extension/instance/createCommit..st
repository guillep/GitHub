*GitHub-Git-Data-operations
createCommit: aCommit

	self flag: #todo. " Implement a better way of doing this in GHTRequester "
	^ NeoJSONObject fromString: (self post: self commitsBaseUrl jsonContent: aCommit)