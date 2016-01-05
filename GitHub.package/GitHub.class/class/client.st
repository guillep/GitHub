accessing
client
	^ self clientClass new
		url: self rootEndpoint;
		" We implement the v3 version of the API. "
		accept: 'application/vnd.github.v3+json' asZnMimeType;
		" We want to pass entities with DELETE requests, so override default option. "
		autoResetEntityMethods: #(#HEAD);
		yourself