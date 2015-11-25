initialization
initializePresenter

	self initializeHiedra.
	log
		multiSelection: false;
		rowInset: 0;
		columns: {
			TreeColumnModel new
				headerLabel: 'Graph';
				displayBlock: [ :item | rulerController rowMorphFor: item content ];
				yourself.
			TreeColumnModel new
				headerLabel: 'SHA';
				displayBlock: [ :item | item content sha first: 7 ];
				yourself.
			TreeColumnModel new
				headerLabel: 'Message';
				displayBlock: [ :item | item content message ];
				yourself.
			TreeColumnModel new
				headerLabel: 'Committed';
				displayBlock: [ :item | self stringForTime: item content commitTime ];
				yourself.
		}.