operations
addCommentWithBody: aString

	^ self
		post: self commentsUrl jsonContent: (NeoJSONObject new
			body: aString;
			yourself);
		responseAs: GHIssueComment