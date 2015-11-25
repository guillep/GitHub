versions
version01: spec
	<version: '0.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.1
Basic API:

* Connect with access token or username and password
* Parse JSON to domain objects (GHObject) using NeoJSONMappings
* Download an avatar of an entity (= user or organization)'.
		spec author: 'SkipLentz'.
		spec timestamp: '10/8/2015 10:35'.
		spec 
			project: 'ZincHTTPComponents' with: '2.6.6';
			project: 'NeoJSON' with: '11'.
		spec 
			package: #GitHub with: 'GitHub-SkipLentz.2';
			package: #'GitHub-Users' with: 'GitHub-Users-SkipLentz.2'. ].
