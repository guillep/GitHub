accessing
neoJsonMapping: mapper
	self basicNeoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #user) valueSchema: GHUser ]