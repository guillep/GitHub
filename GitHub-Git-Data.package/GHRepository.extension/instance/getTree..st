*GitHub-Git-Data-accessing
getTree: aSHA

	^ self
		get: self treesBaseUrl / aSHA;
		responseAs: GHTree