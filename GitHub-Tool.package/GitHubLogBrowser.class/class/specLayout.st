specs
specLayout
	<spec: #default>

	^ SpecLayout composed newRow: [ :row |
		row
			add: #log;
			addSplitter;
			newColumn: [ :col |
				col
					add: #diff;
					addSplitter;
					add: #info.
			]
	]