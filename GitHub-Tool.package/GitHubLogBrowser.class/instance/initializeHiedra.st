initialization
initializeHiedra

	rulerController := HiRulerController new.
	rulerController treeModel: log.
	log whenRootsChanged: [ rulerController updateFromTree ].

	rulerController rulerBuilder
		rowSize: 20;
		columnSize: 8.
	rulerController rulerBuilder nodeBuilder
		width: 4;
		color: Color blue muchDarker.
	rulerController rulerBuilder addLinkBuilder: [ :linkBuilder |
		linkBuilder
			width: 1.5;
			color: Color black;
			targetsBlock: [ :logItem | logItem parents ]
	]