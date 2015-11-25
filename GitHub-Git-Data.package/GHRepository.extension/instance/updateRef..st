*GitHub-Git-Data-operations
updateRef: aRef

	^ self
		patch: self refsBaseUrl / aRef refWithoutPrefix
		jsonContent: aRef asStringForUpdate