as yet unclassified
originalDirectoryToDirectory

	^ originalDirectoryToDirectory
		ifNil: [
			originalDirectoryToDirectory := Dictionary new.
			self packageTreeEntries do: [ :entry |
				originalDirectoryToDirectory
					at: entry path
					put: (self directoryForPackageTree: entry)
			].
			originalDirectoryToDirectory
		]