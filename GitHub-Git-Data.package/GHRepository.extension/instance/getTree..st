*GitHub-Git-Data-accessing
getTree: aSHA

	^ self get: self treesBaseUrl / aSHA decodedAs: GHTree