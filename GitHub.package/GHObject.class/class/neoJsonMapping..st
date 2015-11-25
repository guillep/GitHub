accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapInstVar: #id.
		#(created_at updated_at) do: [ :each |
			(mapping mapInstVar: each) valueSchema: DateAndTime ].
		(mapping mapInstVar: #url) valueSchema: ZnUrl.
	].
	mapper for: DateAndTime customDo: [ :mapping |
		mapping decoder: [ :string | string asDateAndTime ].
	].
	mapper for: ZnUrl customDo: [ :mapping |
		mapping decoder: [ :string | string asZnUrl ].
	].
