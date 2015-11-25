convenience
at: mappingName putIfAbsent: aMappingBlock
	" Get the mappingName and put the mapping if absent "
	self jsonReader mappings
		at: mappingName
		ifAbsent:
			[ self jsonReader for: mappingName customDo: aMappingBlock ].
	^ mappingName