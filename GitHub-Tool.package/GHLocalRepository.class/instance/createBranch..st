branching
createBranch: aBranchName
	| ref |
	ref := GHRef
		ref: 'heads/' , aBranchName
		object: self head.
	self repo createRef: ref.
	branch := aBranchName