accessing
treeEntriesMapping: mapper
	mapper for: #ArrayOfTreeEntries customDo: [ :mapping |
		mapping listOfElementSchema: GHTreeEntryWithSHA
	]