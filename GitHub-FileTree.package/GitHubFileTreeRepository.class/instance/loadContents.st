accessing
loadContents

	" Load all the filenames. "
	self allFileNames.
	" Get all the contents. "
	treeShaToDirectory keysAndValuesDo: [ :sha :dir | | tree |
		tree := repo getTreeRecursively: sha.
		tree tree do: [ :entry |
			self
				createFileOrDirectoryForTreeEntry: entry
				in: dir
		]
	].