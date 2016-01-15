initialization
initializePresenter
	self initializeHiedra.
	self initializeLog.
	log whenSelectedItemsChanged: [ :items | | item |
		items isEmptyOrNil ifFalse: [
			item := items first.
			" Check if it really changed, because Spec/Morphic
			  sometimes sends bogus Announcements. "
			item == self selectedItem ifFalse: [
				selectedItem value: item.
				info text: item message ] ] ]