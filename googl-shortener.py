#!/usr/bin/python

import sys
import googl # http://code.google.com/p/python-googl/

key = "myKeyFromGoogleApiConsole"

api = googl.Googl(key)
link = api.shorten("%clipboard")
sys.stdout.write(link['id'])
