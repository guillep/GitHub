initialization
initializeWithAPI: aGitHubAPI owner: aUsername repository: aRepositoryname branch: aBranchNameOrEmptyOrNil

	repo := (aGitHubAPI user: aUsername) repository: aRepositoryname.
	branch := aBranchNameOrEmptyOrNil isEmptyOrNil
		ifTrue: [ repo defaultBranch ]
		ifFalse: [ aBranchNameOrEmptyOrNil ].