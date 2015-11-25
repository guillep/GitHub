I am a Builder for creating commits in a repository.

My responsibility is to ease the process of specifying the commit (message, branch/ref, replacing, forcing, etc.). I then create a commit on the repository using the specified recipe.

My collaborator is GHRepository.

Public API and Key Messages

- push: Push the commit to the repository
- directory:: Push all of the contents of a directory. This is a convenience method for files: and baseDirectory:.
- baseDirectory: is for specifying what directory we should consider as the root of the repository.
- files: are the files in that baseDirectory. They can be in subdirectories.
- self class>>on: creates a new builder on a repository. Use either this or GHRepository>>commitBuilder.

Example:
[
self commitBuilder
	directory: FileSystem workingDirectory / 'Commit-Files-Dir';
	onBranch: 'anExistingBranch';
	withMessage: 'Commit some more files';
	push.
]
 
Internal Representation and Key Implementation Points.

    Instance Variables
	baseDirectory:		The directory to consider as root. Set manually or set by self>>directory:
	files:				The files to commit.
	force:				Force the update or not.
	message:			The commit message.
	newHead:			
	ref:					The refspec which references the parent commit. Could be refs/heads/master, or refs/notes/commits.
	replace: 				Whether or not the entire tree should be replaced. This is the only way to delete files in the repository.
	repo:				The repository.

Nota Bene: Currently, we ignore only the .git directory. This means no .gitignore. This is because there are multiple places of defining .gitignore (global config, for example), and we don't aim to reimplement git porcelain from scratch.