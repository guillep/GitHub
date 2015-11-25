defaults
setDefaults

	ref := 'heads/' , repo defaultBranch.
	message := self defaultMessage.
	self modifyTree. " Base the tree on an existing tree. "