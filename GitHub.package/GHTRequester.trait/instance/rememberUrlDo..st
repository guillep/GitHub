operations
rememberUrlDo: aBlock
	| urlMemento |

	urlMemento := self client request url.
	^ aBlock ensure: [
		self client url: urlMemento
	]