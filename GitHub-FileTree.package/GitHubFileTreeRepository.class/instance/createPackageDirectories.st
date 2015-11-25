file creation
createPackageDirectories

	self directory hasDirectories
		ifTrue: [ ^ self ].
	self originalDirectoryToDirectory
		values do: #ensureCreateDirectory