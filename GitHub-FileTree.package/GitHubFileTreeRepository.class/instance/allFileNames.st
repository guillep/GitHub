accessing
allFileNames
	" Hack: populate with the directory entries FileTree wants. "
	| tree packageEntries |
	self directory deleteAllChildren.
	self directory: FileSystem memory workingDirectory.
	" Get the current tree at branch. "
	tree := repo getTree: branch.
	packageEntries := tree tree select: [ :entry |
		entry type = 'tree' and: [ self canReadFileNamed: entry path ]].
	packageEntries do: [ :entry | | relevantCommits |
		relevantCommits := repo commitLogger
			inPath: entry path;
			fromShaOrBranch: branch;
			log.
		relevantCommits withIndexDo: [ :commit :index |
			self createExpectedEntriesForPackageTree: entry atCommit: commit index: index] ].
	1halt.
	^ super allFileNames