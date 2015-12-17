executing
log
	" Execute the search. "
	| url |
	url := repo commitsBaseUrl copy.
	url queryAddAll: parameters.
	^ repo
		get: url;
		responseAs: repo arrayOfCommits.