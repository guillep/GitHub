displaying
loginMenu
	| loginFields |
	loginFields := self initializeLoginFields.
	self focusOrder
		remove: repositoryDropDown;
		addAll: loginFields.
	^ ToolDockingBarMorph new
		addAllMorphs: (loginFields collect: #buildWithSpec);
		asSpecAdapter