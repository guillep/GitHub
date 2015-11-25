file creation
createDirectoryForPackageTree: aTreeEntry
	| packageName |
	packageName := aTreeEntry path copyUpToLast: $..
	" Create version directory, e.g. GitHub-FileTree-Author.af67e8b.package "
	^ (self directoryFor: packageName withVersionIdentifier: branch)
		ensureCreateDirectory.