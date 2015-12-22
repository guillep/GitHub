executing
prepareRequest
	| url |
	url := self url.
	self operation = #GET
		ifTrue: [ url queryAddAll: self parameters ]
		ifFalse: [ operandRequester jsonContent: self parametersAsJSON ].
	^ url