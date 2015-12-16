operations
updateContent: aString withMessage: aCommitMessage
	| result encoded newObject |
	encoded := ZnUtils encodeBase64: aString trimBoth.
	result := self
		put: self url jsonContent: (NeoJSONObject new
			message: aCommitMessage;
			content: encoded;
			sha: self sha;
			yourself);
		responseAs: self contentAndCommitPair.
	content := encoded.
	newObject := result at: #content.
	self copyFieldsFrom: newObject.
	^ result at: #commit
	