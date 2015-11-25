loading
loadContents

	" Create the package directories, which fills 'treeShaToDirectory'. "
	| archive archiveName |
	self directory deleteAllChildren.
	archive := repo zipArchiveAt: branch.
	archive extractAllTo: self directory.
	archiveName := archive members first fileName allButLast.
	" Move the contents to the correct filenames. "
	(self directory / archiveName) children do: [ :each |
		self originalDirectoryToDirectory
			at: each basename
			ifPresent: [ :dir | each moveTo: dir ]
			ifAbsent: [ each moveTo: (self directory / each basename) ]
	].
	(self directory / archiveName) delete.