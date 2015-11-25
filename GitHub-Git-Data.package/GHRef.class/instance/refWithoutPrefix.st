accessing-api
refWithoutPrefix
	" Return the refspec without the 'refs/' part in front. "
	^ ref allButFirst: 5 " All but the refs/ part. "