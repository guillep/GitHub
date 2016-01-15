operations
method: aMethodSymbol
	| result |
	result := self client
		method: aMethodSymbol;
		execute.
	self storeETag.
	^ result