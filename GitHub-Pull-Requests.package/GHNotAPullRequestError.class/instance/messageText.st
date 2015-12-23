accessing
messageText

	^ messageText ifNil: [ messageText := 'This issue is not a Pull Request. Use GHRepository>>createPullRequestFromIssue:fromHead:tobase: to turn it into one.'  ]