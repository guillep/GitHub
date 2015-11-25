*GitHub-Git-Data-operations
updateRef: aRef

	^ self patch: self refsBaseUrl / aRef ref jsonContent: aRef asStringForUpdate