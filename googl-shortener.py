#!/usr/bin/python

# depends on http://code.google.com/p/python-googl/

import googl

key = "myKeyFromGoogleApiConsole"

api = googl.Googl(key)
link = api.shorten("%clipboard")
print(link['id'])

