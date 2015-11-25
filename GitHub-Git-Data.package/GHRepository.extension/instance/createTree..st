*GitHub-Git-Data-operations
createTree: aTree

	self flag: #todo. " Implement a better way of doing this in GHTRequester "
	^ NeoJSONObject fromString: (self post: self treesBaseUrl jsonContent: aTree)