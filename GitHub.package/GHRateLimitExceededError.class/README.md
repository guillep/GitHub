I am thrown when the API rate limit is exceeded. See: https://developer.github.com/v3/#rate-limiting.

I carry information on when the rate limit window resets (i.e.: when you can make requests again) and the rate limit itself (5000 for authenticated requests, 60 for unauthenticated requests).