I represent a repository that is loaded in the image. I support basic versioning operations such as checkout, commit and creating branches.

My responsibility is keeping track of the current version of each repository loaded into the image. This means their SHA, and optionally the branch (if it's not detached from the branch).

My collaborators are GitHubFileTreeRepository, for storing the filetree representation, and GHRepository, which represents the remote.

Public API and Key Messages

- checkoutBranch:: Load all the packages at the current branch state on the remote. This method expects a GHBranch instance.
- checkoutCommit:: as checkoutBranch:, but takes a commit instance and leaves the repository in a detached state.
- commitVersions:withMessage:: Commits the given monticello versions with the given message from the current branch. This only works if the repository is not in a detached state. Currently it updates from whatever is currently at the branch's head on the remote, and creates a commit from that branch's head turning the entire tree it into the state it is in at the time of commit. In other words, concurrent updates are not checked against.
- createBranch: Create a new branch with the specified name at the currently checked out commit.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	branch:		GHBranch
	fileTreeRepo:		GitHubFileTreeRepository
	ghRepo:		GHRepository
	head:		GHCommit


    Implementation Points
	This class internally is implemented using Monticello, and still expects Monticello versions to be able to commit anything.