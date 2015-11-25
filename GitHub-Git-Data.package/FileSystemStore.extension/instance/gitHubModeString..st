*GitHub-Git-Data-accessing
gitHubModeString: aFileReference

	(self isDirectory: aFileReference) ifTrue: [
		^ '040000'
	].
	" Must be a blob then. "
	self isSymlink ifTrue: [
		^ '120000'
	].
	self permissions in: [ :perm |
		perm ownerExecute and: [ perm groupExecute and: [ perm otherExecute ] ]
			ifTrue: [
				^ '100755'
			].
		^ '100644'
	]