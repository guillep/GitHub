private
stringForTime: aDateAndTime

	^ ((DateAndTime now - aDateAndTime) roundTo: 1 day)
		humanReadablePrintString , ' ago'.