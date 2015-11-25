I represent a file, directory, symbolic link, or submodule in a GitHub repository (GHRepository).

I provide information about content in a GitHub repository. Furthermore, I can update the content and delete the content on GitHub.

My collaborator is a ZnClient, which I use for requesting deleting or updating content.

Public API and Key Messages

- deleteContentWithMessage:  
- updateContent:withMessage:
- Instances are created with GHRepository>>getContentAtPath:

Example: 

self updateContent: self content , ',
How are you?' withMessage: 'Add friendly question.'.

Internal Representation and Key Implementation Points.

    Instance Variables
	_links:		Dictionary of urls: "git", "self", "html".
	content:		The content, base64 encoded.
	download_url:		<Object>
	encoding:		The encoding of the content, which is always base64 unless changed manually using media types (mimetypes).
	git_url:		<Object>
	html_url:		<Object>
	name:		<Object>
	path:		The path of the content, relative to the root directory of the repository.
	sha:		The SHA, which identifies the version of the blob or tree of this content.
	size:		The size of the content in bytes.
	type:		The type of content. Can be "dir", "file", "symlink" or "submodule" (To be implemented).