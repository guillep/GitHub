displaying
authenticatedMenu
	| user |

	user := self authenticatedUser.
	^ MenuModel new addGroup: [ :group | 
		group addItem: [ :item | 
			item
				name: user login;
				description: 'Currently logged in.';
				icon: (user avatar scaledToSize: 16 @ 16).
		]
	]