accessing
allPackageNames

	^ originalDirectoryToDirectory keys
		collect: [ :pkgDirName | pkgDirName copyUpToLast: $. ]