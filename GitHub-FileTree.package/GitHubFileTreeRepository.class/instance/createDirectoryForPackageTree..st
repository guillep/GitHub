accessing
createDirectoryForPackageTree: aTreeEntry
	| packageName |
	packageName := aTreeEntry path copyUpToLast: $..
	" Create version directory, e.g. GitHub-FileTree.af67e8b.package "
	^ (self directoryFor: packageName withVersionIdentifier: branch)
		ensureCreateDirectory.