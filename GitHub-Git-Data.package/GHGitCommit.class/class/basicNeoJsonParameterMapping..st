accessing - parameter mapping
basicNeoJsonParameterMapping: mapper
	self neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		#(url sha) do: [ :ignore |
			mapping
				mapProperty: ignore
				getter: [ :d | nil ]
				setter: [ :d :v | ]
		].
	].
	#(GHGitCommitObject GHGitTreeObject) do: [ :mapToSha |
		mapper for: mapToSha customDo: [ :mapping |
			mapping encoder: [ :object | object sha ]
		]
	].
	self flag: #todo.
	" Workaround for not setting a writer in NeoJSONCustomMapping>>listOfElementSchema:..."
	mapper for: #ArrayOfGitCommitObjects customDo: [ :mapping |
		mapping writer: [ :jsonWriter :parents |
			jsonWriter writeListStreamingDo: [ :jsonListWriter |
				parents do: [ :each |
					jsonListWriter writeElement: each as: #GHGitCommitObject
				] 
			]
		]
	]