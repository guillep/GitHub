commit
commitVersions: aMonticelloVersionCollection withMessage: aString

	self isDetached ifTrue: [ ^ self ].
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		aMonticelloVersionCollection do: [ :version |
			fileTreeRepo storeVersion: version.
			fileTreeRepo storeDependencies: version
		]
	].
	self gitHubRepository commitBuilder
		replaceTree;
		directory: fileTreeRepo directory;
		withMessage: aString;
		onBranch: branch name;
		push