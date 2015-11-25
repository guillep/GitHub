operations
rememberUrlDo: aBlock
	| urlMemento |

	urlMemento := client request url.
	^ aBlock ensure: [
		client url: urlMemento
	]