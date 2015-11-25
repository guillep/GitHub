accessing
packageTreeEntries
	| tree |
	tree := repo getTree: branch.	" Get the current tree at branch. "
	" Only select directories which are read by FileTree. "
	^ tree tree select: [ :entry |
		entry type = 'tree' and: [ self canReadFileNamed: entry path ] ]