operations
get: urlPathSegments
	| urlMemento result |

	urlMemento := client request url.
	result := client get: urlPathSegments.
	client url: urlMemento.

	^ result