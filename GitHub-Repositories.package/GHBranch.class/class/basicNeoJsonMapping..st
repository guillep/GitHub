accessing
basicNeoJsonMapping: mapper

	mapper for: self do: [ :mapping |
		mapping mapInstVar: #name.
		(mapping mapInstVar: #commit) valueSchema: GHCommit
	]
