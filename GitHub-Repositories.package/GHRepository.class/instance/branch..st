accessing - branches
branch: aBranchName

	^ self get: self branchesBaseUrl / aBranchName decodedAs: GHBranch