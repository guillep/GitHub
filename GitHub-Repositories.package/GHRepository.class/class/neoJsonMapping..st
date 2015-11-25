accessing
neoJsonMapping: mapper
	super neoJsonMapping: mapper.
	" Override for parsing of this special URL:
	   git@github.com:octocat/Hello-World.git
	To solve, we append ssh:// to it and replace the last colon to transform it in this format:
	   ssh://git@github.com/octocat/Hello-World.git "
	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #ssh_url) valueSchema: #SSHUrl.
	].
	mapper for: #SSHUrl customDo: [ :mapping |
		mapping decoder: [ :string |
			string ifNil: nil ifNotNil: [
				| slashIndex stringPathBase |
				slashIndex := string findFirst: [ :c | c = $/ ].
				stringPathBase := string first: slashIndex - 1.
				stringPathBase replaceAll: $: with: $/.
				('ssh://' , stringPathBase , (string allButFirst: slashIndex - 1)) asZnUrl
			]
		].
	].