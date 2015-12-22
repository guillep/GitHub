accessing
neoJsonMapping: mapper
	self basicNeoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		#(user assignee closed_by) do: [ :each |
			(mapping mapInstVar: each) valueSchema: GHUser ] ]