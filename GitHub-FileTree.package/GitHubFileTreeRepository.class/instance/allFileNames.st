accessing
allFileNames
	" Just return the superclass' method result
	if the directories are already loaded. "
	self directory hasDirectories
		ifTrue: [ ^ super allFileNames ].
	" Get the current tree at branch. "
	self packageTreeEntries do: [ :entry | | dir |
		dir := self createDirectoryForPackageTree: entry.
		treeShaToDirectory at: entry sha put: dir.
	].
	^ super allFileNames