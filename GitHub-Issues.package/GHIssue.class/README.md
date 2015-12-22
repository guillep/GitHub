I represent an issue on GitHub.

I can be edited (#editor), be added comments to (#addCommentWithBody:) and be asked for my comments. Furthermore, I can be asked for my state, title, description and several other properties.

My collaborator is GHIssueEditor, which encapsulates the behavior to edit me.

Public API and Key Messages

- Send #editor to instantiate a GHIssueEditor to edit some of this issue's properties.
- Send #addCommentWithBody: to add a comment.
- Send #comments to get an Array of all my comments.
- Create an issue using GHRepository>>issueCreatorWithTitle:, and get an instance of me using GHRepository>>issueByNumber:.