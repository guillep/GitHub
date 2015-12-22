operations
addCommentWithBody: aString

	^ self
		post: self commentsBaseUrl jsonContent: (NeoJSONObject new
			body: aString;
			yourself);
		responseAs: GHIssueComment