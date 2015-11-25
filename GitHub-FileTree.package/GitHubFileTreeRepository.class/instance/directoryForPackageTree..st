file creation
directoryForPackageTree: aTreeEntry
	| packageName dir |
	packageName := aTreeEntry path copyUpToLast: $..
	" Create version directory, e.g. GitHub-FileTree-Author.af67e8b.package "
	dir := self directoryFor: packageName withVersionIdentifier: branch.
	" Save the mapping of the original directory name to the created directory. "
	originalDirectoryToDirectory at: aTreeEntry path put: dir.
	^ dir