private
sourceCodeForUrlInstVars: urlVars
	^ 'urlInstVars
	^ super urlInstVars, {1}' format: {urlVars}