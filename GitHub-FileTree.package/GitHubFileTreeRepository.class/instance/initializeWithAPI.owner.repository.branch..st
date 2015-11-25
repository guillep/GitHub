initialization
initializeWithAPI: aGitHubAPI owner: aUsername repository: aRepositoryname branch: aBranchNameOrEmptyOrNil

	api := aGitHubAPI.
	repo := (api user: aUsername) repository: aRepositoryname.
	branch := aBranchNameOrEmptyOrNil isEmptyOrNil ifTrue: [ repo defaultBranch ].
	username := aUsername.
	repositoryname := aRepositoryname.
	" Everything is stored in here until we write out. "
	self directory: FileSystem memory workingDirectory.