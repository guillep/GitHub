displaying
open
	| inst |

	inst := self new open.
	RememberedAuthenticated ifNotNil: [
		inst authenticatedAPI: RememberedAuthenticated
	]