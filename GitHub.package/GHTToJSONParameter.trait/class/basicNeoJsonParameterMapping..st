accessing - parameter mapping
basicNeoJsonParameterMapping: mapper
	" This method specifies the mapping of this object as a parameter. "

	mapper for: self do: [ :mapping |
		self instVarNamesToParameterNames
			pairsDo: [ :varName :paramName |
				mapping mapInstVar: varName to: paramName.
			]
	]