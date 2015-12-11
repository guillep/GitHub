displaying
loginMenu
	| loginFields |
	loginFields := self initializeLoginFields.
	self focusOrder
		addAll: loginFields.
	^ ToolDockingBarMorph new
		addAllMorphs: (loginFields collect: #buildWithSpec);
		asSpecAdapter