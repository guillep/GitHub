running
setUp
	| port |
	port := self entryPointClass portNumber.
	server := ZnServer on: port.
	server start.
	self 
		assert: server isRunning & server isListening
		description: 'Failed to start server on port ', port asString.
	github := self entryPointClass initializeWithUsername: 'john' password: 'doe'.