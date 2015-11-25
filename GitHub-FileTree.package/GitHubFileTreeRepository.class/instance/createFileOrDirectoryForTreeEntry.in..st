file creation
createFileOrDirectoryForTreeEntry: anEntry in: aDirectoryReference

	anEntry type = 'tree'
		ifTrue: [
			^ (aDirectoryReference resolveString: anEntry path)
				ensureCreateDirectory
		]
		ifFalse: [
			anEntry type = 'blob'
				ifTrue: [ | blobContents |
					blobContents := (repo getBlob: anEntry sha) content.
					^ (aDirectoryReference resolveString: anEntry path)
						writeStreamDo: [ :ws | ws nextPutAll: blobContents ];
						yourself
				]
		]