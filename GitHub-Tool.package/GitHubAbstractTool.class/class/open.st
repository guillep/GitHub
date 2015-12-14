displaying
open
	| inst |

	inst := super open.
	self rememberedAuthenticated ifNotNil: [
		inst authenticatedAPI: RememberedAuthenticated
	]