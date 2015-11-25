initialization
initializeWithClient: aZnClient

	super initializeWithClient: aZnClient.
	self jsonReader: NeoJSONReader new.