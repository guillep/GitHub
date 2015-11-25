versions
version03: spec
	<version: '0.3' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.3
- Added Git-Data API for manipulating git objects (trees, commits, blobs) and refs.
- - Contains a commit builder which eases committing, with several options such as force update, replacing the entire tree, setting the commit message, etc.
- Added writing in FileTree by subclassing from FileTreeRepository.'.
		spec author: 'SkipLentz'.
		spec timestamp: '11/3/2015 17:19'.
		spec 
			project: 'ZincHTTPComponents' with: '2.6.6';
			project: 'NeoJSON' with: '11'.
		spec 
			package: #GitHub with: 'GitHub-SkipLentz.16';
			package: #'GitHub-Users' with: 'GitHub-Users-SkipLentz.4';
			package: 'GitHub-Repositories' with: 'GitHub-Repositories-SkipLentz.6';
			package: #'GitHub-Contents' with: 'GitHub-Contents-SkipLentz.9';
			package: #'GitHub-Git-Data' with: 'GitHub-Git-Data-SkipLentz.11';
			package: #'GitHub-FileTree' with: 'GitHub-FileTree-SkipLentz.3'. ].
