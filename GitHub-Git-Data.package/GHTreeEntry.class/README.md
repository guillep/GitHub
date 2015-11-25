I represent an entry in a tree. I am a very boring object.

My collaborator is GHTree, which holds an List of my instances.
An List of my instances can be passed to createTree in GHRepository.
I contain mutators so that I can be easily changed to create a update in the repository.

Public API and Key Messages

- Instances are created by GHRepository when getting a tree.
- Instances can be created manually using the class side method #path:mode:type:sha:

Internal Representation and Key Implementation Points.

    Instance Variables
	mode:		From GitHub API v3 Reference: 
	  The file mode; one of:
	    - 100644 for file (blob),
	    - 100755 for executable (blob),
	    - 040000 for subdirectory (tree),
	    - 160000 for submodule (commit) or
	    - 120000 for a blob that specifies the path of a symlink
	path:		the string of the path relative to the root repository directory.
	size:		The size in bytes, 0 if type is "dir"
	type: 	The type of the object: blob, tree or submodule (commit).


    Implementation Points