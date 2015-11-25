*GitHub-Git-Data-accessing
getTreeRecursively: aSHA

	^ self get: self treesBaseUrl / aSHA ? ('recursive' -> 1) decodedAs: GHTree