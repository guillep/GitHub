*GitHub-Contents-operations
createContent: aString onPath: pathSegments withMessage: aCommitMessage

	^ self put: (self contentPath: pathSegments) jsonContent: (NeoJSONObject new
		message: aCommitMessage;
		content: (ZnUtils encodeBase64: aString trimBoth);
		yourself)