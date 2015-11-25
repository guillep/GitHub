accessing
avatar
	" Use a oneshot connection for this. "
	^ ZnEasy client
		url: self avatarUrl;
		accept: (ZnMimeType main: 'image' sub: '*');
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		contentReader: [ :entity |
			ImageReadWriter formFromStream: entity readStream
		];
		get.