Issues and Pull Requests API
============================

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Issues and Pull Requests API](#issues-and-pull-requests-api)
    - [Fetching an Issue or Pull Request](#fetching-an-issue-or-pull-request)
    - [Creating an Issue or Pull Request](#creating-an-issue-or-pull-request)
    - [Editing/Manipulating Issues and Pull Requests](#editingmanipulating-issues-and-pull-requests)
        - [Editing an Issue or Pull Request's properties](#editing-an-issue-or-pull-requests-properties)
        - [Leaving a comment](#leaving-a-comment)
        - [Merging a Pull Request](#merging-a-pull-request)
    - [The difference between Issues and Pull Requests](#the-difference-between-issues-and-pull-requests)

<!-- markdown-toc end -->

With this API one can fetch, create and edit/manipulate Issues and Pull Requests.

## Fetching an Issue or Pull Request

Issues can be fetched in two ways: by its number and by requesting a list of issues with optional parameters. The first way can be requested using [`GHRepository`](../GitHub-Repositories.package/GHRepository.class/README.md)`>>`[`issueByNumber:`](../GitHub-Issues.package/GHRepository.extension/instance/issueByNumber..st), by passing it the issue number.

The second way, listing issues, allows one to specify multiple parameters. It is done by following the [Builder pattern](https://en.wikipedia.org/wiki/Builder_pattern), allowing us to specify optional parameters for a result (the issue listing).

For example, one can request all issues assigned to user 'Foo', with the labels 'bug' and 'important', with this script:

```smalltalk
repo issueLister
	assignedTo: 'foo';
	withLabels: #('bug' 'important');
	execute
```

For an exhaustive list of parameters, see [the developer documentation](https://developer.github.com/v3/issues/#list-issues-for-a-repository) on listing issues, and their corresponding methods in [`GHIssueLister`](../GitHub-Issues.package/GHIssueLister.class/README.md).

A Pull Request can be fetched by its number as well, by using [`GHRepository`](../GitHub-Repositories.package/GHRepository.class/README.md)`>>`[`pullRequestByNumber:`](../GitHub-Pull-Requests.package/GHRepository.extension/instance/pullRequestByNumber..st).

The listing of Pull Requests like with issues is not yet implemented. However, one can use the listing of issues and then convert it into a list of [`GHPullRequest`](../GitHub-Pull-Requests.package/GHPullRequest.class/README.md)s like so:

```smalltalk
| listing |
listing := repo issueLister
	" Specify optional filter parameters "
	execute.

listing
	select: #isPullRequest
	thenCollect: #asPullRequest
```

## Creating an Issue or Pull Request

To create an issue, send [`GHRepository`](../GitHub-Repositories.package/GHRepository.class/README.md)`>>`[`issueCreatorWithTitle:`](../GitHub-Issues.package/GHRepository.extension/instance/issueCreatorWithTitle..st) to a [`GHRepository`](../GitHub-Repositories.package/GHRepository.class/README.md) instance. Similar to the listing of issues, one creates an issue by using a Builder too. The builder follows a syntax similar to that of the [`GHIssueLister`](../GitHub-Issues.package/GHIssueLister.class/README.md). Refer to [the developer documentation](https://developer.github.com/v3/issues/#create-an-issue) for all the parameters, and again their corresponding methods in [`GHIssueCreator`](../GitHub-Issues.package/GHIssueCreator.class/README.md).

The same holds for the creation of a pull request, which can be done by sending [`GHRepository`](../GitHub-Repositories.package/GHRepository.class/README.md)`>>`[`pullRequestCreatorWithTitle:head:base:`](../GitHub-Pull-Requests.package/GHRepository.extension/instance/pullRequestCreatorWithTitle.head.base..st) with the title of the pull request, the `head` branch specification (the one that is to be merged) and the `base` branch specification (where `head` should be merged into). Cross-repository pull requests (i.e. pull requests from forks) can be done by prefixing the username to the branch name (`username:branch`).

The API supports one other way of creating a pull request, and that is to turn an existing issue into a pull request. The bindings support this as well, and it can be done by sending [`GHRepository`](../GitHub-Repositories.package/GHRepository.class/README.md)`>>`[`createPullRequestFromIssueNumber:fromHead:toBase:`](../GitHub-Pull-Requests.package/GHRepository.extension/instance/createPullRequestFromIssueNumber.fromHead.toBase..st). Once this is done, the pull request can not in turn be converted back into an issue.

## Editing/Manipulating Issues and Pull Requests

Here I will explain how to manipulate an issue or pull request. By manipulate I mean any operation on an issue or pull request that one can normally do using the Web interface of GitHub.

### Editing an Issue or Pull Request's properties

By sending [`GHIssue`](../GitHub-Issues.package/GHIssue.class/README.md)`>>`[`editor`](../GitHub-Issues.package/GHIssue.class/instance/editor.st) to a [`GHIssue`](../GitHub-Issues.package/GHIssue.class/README.md) or [`GHPullRequest`](../GitHub-Pull-Requests.package/GHPullRequest.class/README.md) instance, one gets a builder as answer with the same parameters as the [`GHIssueCreator`](../GitHub-Issues.package/GHIssueCreator.class/README.md) in the previous section, with several more parameters/actions in addition. The most notable ones are `close` and `open`, which do as their name suggests.

### Leaving a comment

To leave a comment on either an issue or pull request, send `addCommentWithBody`. This returns a [`GHIssueComment`](../GitHub-Issues.package/GHIssueComment.class/README.md) instance which has in turn the ability to edit and delete itself. An example:

```smalltalk
" Get the first issue "
issue := repo issueLister execute first.
comment := issue addCommentWithBody: 'Hello from Pharo.'.
comment editBody: comment body , ' How are you?'.
comment delete.
```

### Merging a Pull Request

To merge a Pull Request, send [`GHPullRequest`](../GitHub-Pull-Requests.package/GHPullRequest.class/README.md)`>>`[`merge`](../GitHub-Pull-Requests.package/GHPullRequest.class/instance/merge.st). There are some other methods for merging too, which allow to set a SHA hash which should match with the current head. This way, if there has been an update since fetching the [`GHPullRequest`](../GitHub-Pull-Requests.package/GHPullRequest.class/README.md) instance, the merge will not continue.

Another method allows one to set the message of the merge commit, and yet another one allows to set both parameters.

If the merge fails, a [`GHPullRequestNotMergeableError`](../GitHub-Pull-Requests.package/GHPullRequestNotMergeableError.class/README.md) is signalled. If the head SHA (if specified) does not match, a [`GHModifiedHeadBranchError`](../GitHub-Pull-Requests.package/GHModifiedHeadBranchError.class/README.md) is signalled.

## The difference between Issues and Pull Requests

In short, every pull request is also an issue, and not vice-versa. This is reflected as well in the class diagram of the bindings.

Because of this, one can request a pull request by its number using the issues API. But the API will return an instance of [`GHIssue`](../GitHub-Issues.package/GHIssue.class/README.md). Thus, a way is needed to test whether an issue is actually a pull request, or if it's just an ordinary issue. This is provided by [`GHIssue`](../GitHub-Issues.package/GHIssue.class/README.md)`>>`[`isPullRequest`](../GitHub-Issues.package/GHIssue.class/instance/isPullRequest.st).

Furthermore, an existing [`GHIssue`](../GitHub-Issues.package/GHIssue.class/README.md) can be converted into a [`GHPullRequest`](../GitHub-Pull-Requests.package/GHPullRequest.class/README.md) by sending [`GHIssue`](../GitHub-Issues.package/GHIssue.class/README.md)`>>`[`asPullRequest`](../GitHub-Pull-Requests.package/GHIssue.extension/instance/asPullRequest.st). Do note that this will perform a request, since a pull request contains extra information not present in an issue. If the [`GHIssue`](../GitHub-Issues.package/GHIssue.class/README.md) is not a pull request (`#isPullRequest` returns false), this results in a [`GHNotAPullRequestError`](../GitHub-Pull-Requests.package/GHNotAPullRequestError.class/README.md).
