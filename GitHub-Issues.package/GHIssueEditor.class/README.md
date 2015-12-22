I am an editor of issues. I can modify an existing issue with the parameters that can be used upon creation (see superclass), and aditionally I can close or open an issue.

I operate on a GHIssue instance.

Public API and Key Messages

- See the API documentation at https://developer.github.com/v3/issues/#edit-an-issue
- closeIssue or openIssue: close or open the issue.
- Use GHIssue>>editor or use self class>>on: with a GHIssue as parameter to instantiate me.

issue editor
	closeIssue;
	title: '[closed]' , issue title;
	withLabels: #('not-fixed');
	body: issue body,
'Edit: nevermind.';
	milestone: nil
