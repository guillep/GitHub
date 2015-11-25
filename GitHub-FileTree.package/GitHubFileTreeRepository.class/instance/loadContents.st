loading
loadContents

	" Create the package directories, which fills 'treeShaToDirectory'. "
	self createPackageDirectories.
	" Get all the contents. "
	treeShaToDirectory keysAndValuesDo: [ :sha :dir | | tree |
		tree := repo getTreeRecursively: sha.
		tree tree do: [ :entry |
			self
				createFileOrDirectoryForTreeEntry: entry
				in: dir
		]
	].