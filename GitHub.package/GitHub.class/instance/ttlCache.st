accessing
ttlCache

	^ ttlCache ifNil: [ 
		ttlCache := TTLCache new
			timeToLive: self timeToLive ]