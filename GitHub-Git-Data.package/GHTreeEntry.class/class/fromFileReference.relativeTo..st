instance creation
fromFileReference: aFileReference relativeTo: aBaseDirectory

	^ self
		path: ((aFileReference relativeToPath: aBaseDirectory)
			printWithDelimiter: $/)
		mode: aFileReference gitHubModeString
		type: aFileReference gitHubTypeString