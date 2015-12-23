accessing
arrayOfIssueComments

	^ self
		putMapping: [ :mapping |
			mapping listOfElementSchema: GHIssueComment ]
		ifAbsentAt: #ArrayOfIssueComments