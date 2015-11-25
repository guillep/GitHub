versions
version02: spec
	<version: '0.2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.2
New features:

* Get repositories of GHEntities.
* Get, create, update, and delete contents of a repository.'.
		spec author: 'SkipLentz'.
		spec timestamp: '10/26/2015 17:22'.
		spec 
			project: 'ZincHTTPComponents' with: '2.6.6';
			project: 'NeoJSON' with: '11'.
		spec 
			package: #GitHub with: 'GitHub-SkipLentz.9';
			package: #'GitHub-Users' with: 'GitHub-Users-SkipLentz.4';
			package: #'GitHub-Repositories' with: 'GitHub-Repositories-SkipLentz.5';
			package: #'GitHub-Contents' with: 'GitHub-Contents-SkipLentz.4'. ].
