*GitHub-Git-Data-accessing
getBlob: aSHA

	^ self get: self blobsBaseUrl / aSHA decodedAs: GHBlob