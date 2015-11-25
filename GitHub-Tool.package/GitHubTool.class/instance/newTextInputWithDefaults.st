widgets
newTextInputWithDefaults

	^ self newTextInput
		wantsVisualFeedback: false;
		autoAccept: true;
		acceptOnCR: false;
		yourself