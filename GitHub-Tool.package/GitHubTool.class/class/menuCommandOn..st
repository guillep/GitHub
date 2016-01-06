world menu
menuCommandOn: aBuilder
	"I register GithubTool to the world menu."

	<worldMenu>
	(aBuilder item: #GitHub)
		order: 0.1;
		icon: Smalltalk tools monticelloBrowser taskbarIcon;
		label: 'GitHub Tool';
		action: [ self open ]