loading
load

	fileTreeRepo loadContents.
	fileTreeRepo allFileNames do: [ :packageName |
		(fileTreeRepo versionFromFileNamed: packageName)
			load
	]