accessing
neoJsonMapping: mapper
	self basicNeoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		self flag: #todo. " A lot of fields will be nil in GHUser... "
		#(author committer) do: [ :each |
			(mapping propertyNamed: each ifAbsent: []) valueSchema: GHUser ].
		(mapping propertyNamed: #commit ifAbsent: [] ) valueSchema: GHGitCommit.
	]