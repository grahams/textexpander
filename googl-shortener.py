#!/usr/bin/python

# This snippet requires:
# 1) The official [Google API Client Libraries: 
#       https://code.google.com/p/google-api-python-client/
#       (pip install --upgrade google-api-python-client)
#
# 2) A simple API key from Google: 
#       https://developers.google.com/console/help/#generatingdevkeys
#

import sys
from apiclient.discovery import build 

key = "myKeyFromGoogleApiConsole"

service = build('urlshortener', 'v1', developerKey=key)

url = service.url()

# Create a shortened URL by inserting the URL into the url collection.
body = {'longUrl': '%clipboard' }
resp = url.insert(body=body).execute()

sys.stdout.write(resp['id'])
