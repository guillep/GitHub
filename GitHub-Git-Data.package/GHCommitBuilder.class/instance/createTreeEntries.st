building
createTreeEntries

	^ files collect: [ :file |
		file isDirectory 
			ifTrue: [
				" Create a new tree? "
				nil
			]
			ifFalse: [
				GHTreeEntryWithContent
					fromFileReference: file
					relativeTo: baseDirectory
			]
	].