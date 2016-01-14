world menu
menuCommandOn: aBuilder
	"I register GithubTool to the world menu."

	<worldMenu>
	(aBuilder item: #GitHub)
		order: 0.28;
		icon: Smalltalk ui icons versionControl;
		parent: #Tools;
		label: 'GitHub Tool';
		action: [ self open ]