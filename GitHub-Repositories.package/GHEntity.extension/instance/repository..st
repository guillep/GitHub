*GitHub-Repositories-accessing
repository: aRepositoryName
	" Get a repository bearing aRepositoryName as name of this entity. "

	^ self
		get: 'repos/' , self login , '/' , aRepositoryName;
		responseAs: GHRepository