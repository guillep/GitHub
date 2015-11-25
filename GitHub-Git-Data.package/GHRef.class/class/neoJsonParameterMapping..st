accessing - parameter mapping
neoJsonParameterMapping: mapper
	" This method specifies the mapping of this object as a parameter. "
	self basicNeoJsonParameterMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping
			mapProperty: #sha
			getter: [ :ref | ref object sha ]
			setter: [ :ref :sha | ref object sha: sha ]
	].