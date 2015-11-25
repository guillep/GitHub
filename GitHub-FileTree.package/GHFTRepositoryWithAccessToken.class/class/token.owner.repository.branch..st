instance creation
token: aTokenString owner: anOwnerString repository: aRepoString branch: aBranchString

	^ self new
		initializeWithAPI: (GitHub initializeWithAccessToken: aTokenString)
		owner: anOwnerString
		repository: aRepoString
		branch: aBranchString