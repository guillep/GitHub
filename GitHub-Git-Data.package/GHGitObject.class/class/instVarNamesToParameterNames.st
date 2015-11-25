accessing - parameter mapping
instVarNamesToParameterNames
	" Parameter names can differ from the inst var names.
	For example: 'sha' becomes 'base_tree' when passing a GHTree as parameter. "
	^ #(sha sha)