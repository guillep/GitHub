*GitHub-Git-Data-accessing
gitHubModeString: aFileReference

	(aFileReference isDirectory) ifTrue: [
		^ '040000'
	].
	" Must be a blob then. MemoryStore does not support
	  symlinks, nor permissions. So just return ordinary blob mode "
	^ '100644'