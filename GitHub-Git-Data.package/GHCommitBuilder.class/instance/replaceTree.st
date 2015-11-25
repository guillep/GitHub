accessing-commit
replaceTree
	" Replace the tree, deleting any files in the current tree 
	that are not present in the new tree. "
	treeBlock := [ :sha |
		(repo getTreeRecursively: sha)
			beFromScratch;
			yourself
	]