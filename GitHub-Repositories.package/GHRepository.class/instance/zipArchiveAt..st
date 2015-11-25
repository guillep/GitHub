as yet unclassified
zipArchiveAt: aGitReferenceString
	| bytes |
	bytes := self get: self zipArchiveUrl / aGitReferenceString.
	^ ZipArchive new readFrom: bytes readStream.