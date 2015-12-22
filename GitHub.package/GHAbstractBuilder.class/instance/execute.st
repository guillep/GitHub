executing
execute
	| url |
	self validateRequirements.
	url := self prepareRequest.
	^ operandRequester
		method: self operation on: url;
		responseAs: self resultValueSchema