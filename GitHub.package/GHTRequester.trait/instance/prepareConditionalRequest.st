private
prepareConditionalRequest

	| url |
	url := self client request url.
	self urlToETag
		at: url
		ifPresent: [ :eTag |
			self client
				headerAt: 'If-None-Match'
				put: eTag ]