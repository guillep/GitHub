*GitHub-Git-Data-accessing
getRef: aRef
	" Get a reference, with aRef formatted as heads/master, for example. "
	^ self get: self refsBaseUrl / aRef decodedAs: GHRef