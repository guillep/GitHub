displaying
open
	| inst |

	inst := self new open.
	self rememberedAuthenticated ifNotNil: [
		inst authenticatedAPI: RememberedAuthenticated
	]