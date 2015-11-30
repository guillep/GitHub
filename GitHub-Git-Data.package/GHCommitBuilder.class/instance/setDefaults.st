defaults
setDefaults

	ref := 'heads/' , repo defaultBranch.
	message := self defaultMessage.
	workBlock := [ self doPush ].
	self modifyTree. " Base the tree on an existing tree. "