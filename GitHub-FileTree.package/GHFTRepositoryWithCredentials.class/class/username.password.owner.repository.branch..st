instance creation
username: aUsernameString password: aPasswordString owner: anOwnerString repository: aRepoString branch: aBranchString

	^ self
		initializeWithAPI: (GitHub initializeWithUsername: aUsernameString password: aPasswordString)
		owner: anOwnerString
		repository: aRepoString
		branch: aBranchString