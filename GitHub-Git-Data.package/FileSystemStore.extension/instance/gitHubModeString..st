*GitHub-Git-Data-accessing
gitHubModeString: aFileReference

	(aFileReference isDirectory) ifTrue: [
		^ '040000'
	].
	" Must be a blob then. "
	aFileReference isSymlink ifTrue: [
		^ '120000'
	].
	aFileReference permissions in: [ :perm |
		(perm ownerExecute and: [ perm groupExecute and: [ perm otherExecute ] ])
			ifTrue: [
				^ '100755'
			].
		^ '100644'
	]