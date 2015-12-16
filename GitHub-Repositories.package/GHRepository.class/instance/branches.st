accessing - branches
branches

	^ self
		get: self branchesBaseUrl;
		responseAs: self arrayOfBranches