printing
jsonWriterOn: aStream
	" Users of this trait may override this to cache mappings
	in an instance variable, similar to the jsonReader instance
	variable in GitHubAPIObject. "
	^ NeoJSONWriter on: aStream