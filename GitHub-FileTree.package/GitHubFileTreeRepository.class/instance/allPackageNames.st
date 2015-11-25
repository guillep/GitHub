accessing
allPackageNames

	^ self allFileNames
		collect: [ :pkgDirName | pkgDirName copyUpToLast: $. ]