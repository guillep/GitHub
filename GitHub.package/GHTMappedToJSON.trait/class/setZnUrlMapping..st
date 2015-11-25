accessing
setZnUrlMapping: mapper

	mapper for: ZnUrl customDo: [ :mapping |
		mapping decoder: [ :string |
			string ifNil: nil ifNotNil: [ string asZnUrl ]
		].
		mapping encoder: [ :url |
			url ifNil: nil ifNotNil: [ url asString ]
		].
	].
