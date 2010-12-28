set the ClipURL to (the clipboard as string)

ignoring case
	if ((characters 1 through 4 of ClipURL as string) is not "http") then
		return "Malformed URL."
	else
		set the EncodedClipURL to urlencode(ClipURL) of me
		set curlCMD to Â
			"curl --stderr /dev/null -d \"user=toolbar@google.com&url=" & EncodedClipURL & "\" http://goo.gl/api/url"
		
		set jsonText to (do shell script curlCMD)
		set googlURL to parseJSON(jsonText) as string
		
		return googlURL
	end if
end ignoring

on parseJSON(theText)
	set resultText to ""
	
	set AppleScript's text item delimiters to ","
	set theTextItems to text items of theText
	set AppleScript's text item delimiters to {""}
	get item 1 of theTextItems
	
	set targetPair to null
	
	repeat with theValue in theTextItems
		set theOffset to (offset of "short_url" in theValue)
		
		if theOffset > 0 then
			set targetPair to theValue
		end if
	end repeat
	
	set AppleScript's text item delimiters to "\""
	set subUnits to text items of targetPair
	set AppleScript's text item delimiters to {""}
	
	set finalURL to null
	
	repeat with theValue in subUnits
		set theOffset to (offset of "http" in theValue)
		
		if theOffset > 0 then
			set finalURL to theValue
		end if
	end repeat
	
	return finalURL
end parseJSON

on urlencode(theText)
	set theTextEnc to ""
	repeat with eachChar in characters of theText
		set useChar to eachChar
		set eachCharNum to ASCII number of eachChar
		if eachCharNum = 32 then
			set useChar to "+"
		else if (eachCharNum ­ 42) and (eachCharNum ­ 95) and (eachCharNum < 45 or eachCharNum > 46) and (eachCharNum < 48 or eachCharNum > 57) and (eachCharNum < 65 or eachCharNum > 90) and (eachCharNum < 97 or eachCharNum > 122) then
			set firstDig to round (eachCharNum / 16) rounding down
			set secondDig to eachCharNum mod 16
			if firstDig > 9 then
				set aNum to firstDig + 55
				set firstDig to ASCII character aNum
			end if
			if secondDig > 9 then
				set aNum to secondDig + 55
				set secondDig to ASCII character aNum
			end if
			set numHex to ("%" & (firstDig as string) & (secondDig as string)) as string
			set useChar to numHex
		end if
		set theTextEnc to theTextEnc & useChar as string
	end repeat
	return theTextEnc
end urlencode

