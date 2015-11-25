accessing
neoJsonMapping: mapper
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name login).
		(mapping mapInstVar: #avatar_url) valueSchema: ZnUrl.
	]