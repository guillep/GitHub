building
doPush
	" Build the commit. "
	| curHeadRef curHead curTree treeEntries treeResponse newHead commitResponse updateRefResponse |
	curHeadRef := repo getRef: ref.
	curHead := repo getCommit: curHeadRef object sha.
	curTree := treeBlock value: curHead tree sha.
	treeEntries := self createTreeEntries.
	" Replace the old tree entries. "
	curTree tree: treeEntries.
	treeResponse := repo createTree: curTree.
	newHead := GHGitCommit
		message: message
		parents: (Array with: (GHGitObject sha: curHead sha type: 'commit'))
		tree: (GHGitObject sha: treeResponse sha type: 'tree').
	" Create the commit and update the head reference. "
	commitResponse := repo createCommit: newHead.
	newHead sha: (commitResponse sha).
	curHeadRef object: newHead.
	curHeadRef force: force.
	updateRefResponse := repo updateRef: curHeadRef.