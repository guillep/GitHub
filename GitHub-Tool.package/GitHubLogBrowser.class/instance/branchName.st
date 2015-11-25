accessing
branchName

	^ self branch
		ifNil: [ self repository
			ifNil: [ nil ]
			ifNotNil: [ self repository defaultBranch ] ]
		ifNotNil: [ self branch name ]