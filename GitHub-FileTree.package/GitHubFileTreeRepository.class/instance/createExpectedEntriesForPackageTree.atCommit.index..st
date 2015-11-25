accessing
createExpectedEntriesForPackageTree: aTreeEntry atCommit: aCommit index: anIndex
	| packageName shortCommitSHA metaDirPath metaContents packageDirRef metaDirRef |
	packageName := aTreeEntry path copyUpToLast: $..
	shortCommitSHA := aCommit sha first: 7.
	" Create version directory, e.g. GitHub-FileTree.af67e8b.package "
	packageDirRef := (self directoryFor: packageName withSHA: shortCommitSHA)
		ensureCreateDirectory.
	metaDirRef := (packageDirRef / self monticelloMetaDirName)
		ensureCreateDirectory.
	metaDirPath := aTreeEntry path , '/' , self monticelloMetaDirName.
	self flag: #todo. " What if aCommit deleted the package? "
	metaContents := repo
		get: (repo contentApiUrl: metaDirPath) ? ('ref' -> aCommit sha)
		decodedAs: repo arrayOfContents.
	" Get the actual contents, the above query only returns the paths.. "
	metaContents := metaContents collect: [ :content |
		repo getContentAtPath: content path atRef: aCommit sha ].
	metaContents do: [ :content | 
			metaDirRef / content path
				writeStreamDo: [ :stream | stream nextPutAll: content content ] ].