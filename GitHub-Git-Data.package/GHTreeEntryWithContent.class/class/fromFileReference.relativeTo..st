instance creation
fromFileReference: aFileReference relativeTo: aBaseDirectory.
	" Convert aFileReference to a TreeEntry,
	  correctly setting the fields accordingly.
	  Must be a file, since a directory can't have contents itself."
	aFileReference isDirectory ifTrue: [ self error: 'Must be a file.'].
	^ (super fromFileReference: aFileReference relativeTo: aBaseDirectory)
		content: aFileReference contents;
		yourself