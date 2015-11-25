accessing
neoJsonMapping: mapper
	super neoJsonMapping: mapper.

	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #tree) valueSchema: #ArrayOfTreeEntries.
	].
	mapper for: #ArrayOfTreeEntries customDo: [ :mapping |
		mapping listOfElementSchema: GHTreeEntryWithSHA.
	]