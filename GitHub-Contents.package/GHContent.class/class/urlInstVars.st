accessing
urlInstVars
	^ (super urlInstVars) , #(#download_url #git_url #html_url)