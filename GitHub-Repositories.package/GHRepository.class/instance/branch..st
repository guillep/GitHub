accessing - branches
branch: aBranchName

	^ self
		get: self branchesBaseUrl / aBranchName;
		responseAs: GHBranch