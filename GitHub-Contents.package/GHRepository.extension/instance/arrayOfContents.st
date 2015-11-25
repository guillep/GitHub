*GitHub-Contents-accessing
arrayOfContents

	^ self
		at: #ArrayOfContents
		putIfAbsent: [ :mapping |
			mapping listOfElementSchema: GHContent
		]