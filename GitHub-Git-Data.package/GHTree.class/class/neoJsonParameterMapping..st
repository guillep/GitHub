accessing - parameter mapping
neoJsonParameterMapping: mapper
	" This method specifies the mapping of this object as a parameter. "
	super neoJsonParameterMapping: mapper.
	" Set all of the Tree entry mappings. "
	GHTreeEntry allSubclassesDo: [ :class |
		class neoJsonParameterMapping: mapper.
	].