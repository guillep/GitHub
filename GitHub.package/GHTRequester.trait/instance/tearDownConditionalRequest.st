private
tearDownConditionalRequest

	self client request headers
		removeKey: 'If-None-Match'
		ifAbsent: [ " Don't do anything. " ]