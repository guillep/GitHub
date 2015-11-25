accessing
neoJsonMapping: mapper
	self basicNeoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #tree) valueSchema: #ArrayOfTreeEntries
	].
	self treeEntriesMapping: mapper