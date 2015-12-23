*GitHub-Issues-accessing
arrayOfIssues

	^ self
		putMapping: [ :mapping |
			mapping listOfElementSchema: GHIssue ]
		ifAbsentAt: #ArrayOfIssues