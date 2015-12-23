accessing
urlInstVars
	^ (super urlInstVars) , #(#labels_url #comments_url #html_url #events_url)