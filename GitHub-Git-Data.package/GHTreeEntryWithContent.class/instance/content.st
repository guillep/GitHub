accessing
content
	" Override Trait method, this one decodes and encodes to
	a ByteArray instead of a ByteString "
	^ ZnBase64Encoder new decode: self contentEncoded