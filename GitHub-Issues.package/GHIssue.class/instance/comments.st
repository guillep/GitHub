accessing
comments

	^ self
		get: self commentsUrl;
		responseAs: self arrayOfIssueComments