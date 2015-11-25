initialization
initializeWidgets

	log := self newTree.
	diff := self instantiate: DiffModel.
	info := self newText.

	log
		multiSelection: false;
		roots: (1 to: 5);
		rowInset: 0;
		columns: {
			TreeColumnModel new
				headerLabel: 'Graph';
				displayBlock: [ :item | 'Hai' ];
				yourself.
			TreeColumnModel new
				headerLabel: 'SHA';
				displayBlock: [ :item | '269beec' ];
				yourself.
			TreeColumnModel new
				headerLabel: 'Message';
				displayBlock: [ :item | 'Undo last 4 commits' ];
				yourself.
		}.