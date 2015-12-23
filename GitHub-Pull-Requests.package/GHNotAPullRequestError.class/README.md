Signalled when trying to sending #asPullRequest to a GHIssue which is an actual issue (i.e. has no pull_request key).

To turn an issue into a Pull Request, send the message createPullRequestFromIssue:fromHead:toBase: to a GHRepository instance with as your parameter the issue and branch names.

Alternatively, if you know the issue number without having a GHIssue instance, send createPullRequestFromIssueNumber:fromHead:toBase: to a GHRepository.