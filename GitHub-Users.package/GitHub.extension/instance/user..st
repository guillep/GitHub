*GitHub-Users-accessing
user: aUsername

	^ self
		get: 'users/' , aUsername;
		responseAs: GHUser