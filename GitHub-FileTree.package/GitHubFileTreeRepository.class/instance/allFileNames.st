accessing
allFileNames
	" Just return the superclass' method result
	if the directories are already loaded. "

	self directory hasDirectories
		ifTrue: [ ^ super allFileNames ].
	self createPackageDirectories.
	^ super allFileNames