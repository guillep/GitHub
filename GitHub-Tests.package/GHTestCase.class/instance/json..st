convenience
json: aString
	| withUrl |
	withUrl := NeoJSONWriter toString:
		((NeoJSONReader fromString: aString)
			at: #url put: server localUrl asString;
			yourself).
	^ ZnResponse ok: (ZnStringEntity json: withUrl)