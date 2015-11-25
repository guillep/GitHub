accessing
setZnUrlMapping: mapper

	mapper for: ZnUrl customDo: [ :mapping |
		mapping decoder: [ :string |
			string ifNil: nil ifNotNil: [ string asZnUrl ]
		].
	].
