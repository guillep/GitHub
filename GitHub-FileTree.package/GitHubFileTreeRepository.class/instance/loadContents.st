loading
loadContents
	" Download a zip archive and move all the contents to the
	root directory. "
	| archive archiveName |
	self directory deleteAllChildren.
	archive := repo zipArchiveAt: branch.
	archive extractAllTo: self directory.
	archiveName := archive members first fileName allButLast.
	" Move the contents to the correct filenames. "
	(self directory / archiveName) children do: [ :each |
		each moveTo: (self directory / each basename)
	].
	(self directory / archiveName) delete.