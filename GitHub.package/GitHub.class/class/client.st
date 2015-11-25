accessing
client
	^ self clientClass new
		https;
		host: 'api.github.com';
		" We want to pass entities with DELETE requests, so override default option. "
		autoResetEntityMethods: #(HEAD);
		yourself.