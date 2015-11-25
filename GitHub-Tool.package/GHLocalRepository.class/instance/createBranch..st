branching
createBranch: aBranchName
	| ref |
	ref := GHRef
		ref: 'heads/' , aBranchName
		object: (GHGitObject sha: self head type: 'commit').
	self repo createRef: ref.
	branch := aBranchName