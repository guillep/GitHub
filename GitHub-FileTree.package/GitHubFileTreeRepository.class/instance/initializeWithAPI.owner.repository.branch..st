initialization
initializeWithAPI: aGitHubAPI owner: aUsername repository: aRepositoryname branch: aBranchNameOrEmptyOrNil

	api := aGitHubAPI.
	repo := (api user: aUsername) repository: aRepositoryname.
	branch := aBranchNameOrEmptyOrNil isEmptyOrNil
		ifTrue: [ repo defaultBranch ]
		ifFalse: [ aBranchNameOrEmptyOrNil ].
	username := aUsername.
	repositoryname := aRepositoryname.