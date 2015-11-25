*GitHub-Repositories-accessing
repository: aRepositoryName
	" Get all repositories of this entity. "

	^ self
		get: 'repos/' , self login , '/' , aRepositoryName
		as: GHRepository