specs
specLayout
	<spec: #default>

	^ SpecLayout composed newColumn: [ :col |
		col
			newRow: [ :row |
				row
					add: #repositoryDropDown;
					add: #checkoutButton;
					add: #commitButton
			] height: self toolbarHeight - 4;
			add: #logBrowser
	]