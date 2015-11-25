instance creation
fromFileReference: aFileReference.
	" Convert aFileReference to a TreeEntry,
	  correctly setting the fields accordingly.
	  Must be a file, since a directory can't have contents itself."
	aFileReference isDirectory ifTrue: [ self error: 'Must be a file.'].
	^ (super fromFileReference: aFileReference)
		content: aFileReference contents;
		yourself