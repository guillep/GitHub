*GitHub-Repositories-accessing
repositories
	" Get all repositories of this entity. "

	^ self
		get: self repositoriesUrl;
		responseAs: self arrayOfRepos