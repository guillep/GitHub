I represent a resource on GitHub.

I contain the time I was created, last updated, my ID, and my API URL. I can be tested if I am outdated by sending #isOutdated, and I can update my fields if I am outdated, by sending #update to me.

Being a GHRelObject, I can make requests to the GitHub API.

Public API and Key Messages

- Send #hasBeenUpdated to test if the #updatedAt and #createdAt timestamps are unequal.
- Use #isOutdated to test if this representation is outdated with the corresponding resource on GitHub.
- Use #update to update my fields if they are outdated.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	created_at:		The time I was first created.
	id:		The ID of the resource I represent. This is probably not necessary for someone to access.
	updated_at:		The time I was last updated.
	url:		The URL of the resource I represent.