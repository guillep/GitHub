initialization
initializeWidgets

	log := self newTree.
	diff := self instantiate: DiffModel.
	info := self newText.