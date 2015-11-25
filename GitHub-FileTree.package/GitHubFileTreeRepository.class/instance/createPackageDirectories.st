file creation
createPackageDirectories

	self directory hasDirectories
		ifTrue: [ ^ self ].
	self packageTreeEntries do: [ :entry | | dir |
		dir := self createDirectoryForPackageTree: entry.
		" Save the mapping of the tree sha to the created directory. "
		treeShaToDirectory at: entry sha put: dir
	]