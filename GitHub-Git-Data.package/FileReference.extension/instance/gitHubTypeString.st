*GitHub-Git-Data-accessing
gitHubTypeString
	" Reference: https://developer.github.com/v3/git/trees/#create-a-tree "
	^ self isDirectory
		ifTrue: [ 'tree' ]
		ifFalse: [ 'blob' ]