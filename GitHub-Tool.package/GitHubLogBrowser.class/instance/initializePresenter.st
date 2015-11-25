initialization
initializePresenter

	self initializeHiedra.
	log
		multiSelection: false;
		rowInset: 0;
		whenSelectedItemsChanged: [ :items |
			items isEmptyOrNil ifFalse: [
				info text: items last message.
			]
		];
		iconBlock: [ :item | self iconForItem: item ];
		columns: {
			TreeColumnModel new
				headerLabel: 'Graph';
				displayBlock: [ :item | rulerController rowMorphFor: item content ];
				initialWidth: 50;
				yourself.
			TreeColumnModel new
				headerLabel: 'SHA';
				displayBlock: [ :item | item content sha first: 7 ];
				initialWidth: 60;
				yourself.
			TreeColumnModel new
				headerLabel: 'Message';
				displayBlock: [ :item | item content message ];
				initialWidth: 190;
				yourself.
			TreeColumnModel new
				headerLabel: 'Committed';
				displayBlock: [ :item | self stringForTime: item content commitTime ];
				yourself.
		}.