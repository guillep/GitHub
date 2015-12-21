private
putMapping: aMappingBlock ifAbsentAt: mappingName
	" Get the mappingName and put the mapping if absent. This requires
	  the JSONReader to be stateful (i.e. stored in memory). "
	self jsonReader mappings
		at: mappingName
		ifAbsent:
			[ self jsonReader for: mappingName customDo: aMappingBlock ].
	^ mappingName