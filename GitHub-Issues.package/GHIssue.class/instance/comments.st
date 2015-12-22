accessing
comments

	^ self
		get: self commentsBaseUrl;
		responseAs: self arrayOfIssueComments