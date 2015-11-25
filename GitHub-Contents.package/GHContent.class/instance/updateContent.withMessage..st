operations
updateContent: aString withMessage: aCommitMessage

	^ self put: self url jsonContent: (NeoJSONObject new
		message: aCommitMessage;
		content: (ZnUtils encodeBase64: aString trimBoth);
		sha: self sha;
		yourself)