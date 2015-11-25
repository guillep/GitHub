accessing - parameter mapping
instVarNamesToParameterNames
	" 'sha' becomes 'base_tree' when passing a GHTree as parameter. "
	^ #(
		#sha #base_tree
		#tree #tree
	)