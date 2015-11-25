initialization
initializeWidgets

	log := self newTree.
	diff := (self instantiate: DiffModel)
		showOptions: false;
		yourself.
	info := self newText.