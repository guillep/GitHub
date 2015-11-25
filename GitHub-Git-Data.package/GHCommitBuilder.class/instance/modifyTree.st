accessing-commit
modifyTree
	" Let the new tree be based on the previous one. "
	treeBlock := [ :sha | repo getTree: sha ].