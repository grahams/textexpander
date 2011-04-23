#!/usr/bin/python

import googl # http://code.google.com/p/python-googl/

key = "myKeyFromGoogleApiConsole"

api = googl.Googl(key)
link = api.shorten("%clipboard")
print(link['id'])

