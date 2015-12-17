*GitHub-Contents-accessing
arrayOfContents
	^ self
		putMapping: [ :mapping | mapping listOfElementSchema: GHContent ]
		ifAbsentAt: #ArrayOfContents