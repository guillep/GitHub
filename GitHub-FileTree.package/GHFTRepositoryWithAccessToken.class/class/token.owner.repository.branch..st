instance creation
token: aTokenString owner: anOwnerString repository: aRepoString branch: aBranchString

	^ self
		initializeWithAPI: (GitHub initializeWithAccessToken: aTokenString)
		owner: anOwnerString
		repository: aRepoString
		branch: aBranchString