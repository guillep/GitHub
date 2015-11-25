accessing
neoJsonMapping: mapper
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #tree) valueSchema: #ArrayOfTreeEntries
	].
	self treeEntriesMapping: mapper