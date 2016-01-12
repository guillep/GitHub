private
mostUpToDateETag
	" Get the most up-to-date ETag. If my
	  ETag is nil, store the most up-to-date
	  one too. "
	self client url: self url.
	^ self urlToETag
		at: self client request url
		ifPresent: [ :upToDate |
			eTag ifNil: [ eTag := upToDate ].
			upToDate ]
		ifAbsent: [ nil ]