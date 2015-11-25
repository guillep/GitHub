instance creation
fromFileReference: aFileReference

	^ self
		path: aFileReference pathString
		mode: aFileReference gitHubModeString
		type: aFileReference gitHubTypeString