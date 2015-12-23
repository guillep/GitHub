I represent a Pull Request on GitHub.

Being an issue by design, I support all the operations of GHIssue (commenting, or all operations supported by GHPullRequestEditor). In addition, I can be merged and tested for mergability.

My collaborator is GHPullRequestEditor, which can edit several attributes of me.

Public API and Key Messages

- Send any of the merge* methods to attempt to merge me. 
- editor to edit some of my attributes, or addCommentWithBody: to add a top-level review comment.
- I can be created using createPullRequestFromIssue{Number}:fromHead:toBase:, using a GHPullRequestCreator (see class comment), by sending #asPullRequest to a GHIssue which is a pull request, or by passing the pull request number to GHRepository>>pullRequestByNumber: