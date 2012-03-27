#!/usr/bin/python

# based on: https://gist.github.com/2220524

import sys
import urllib
import json

numParagraphs = 2
url = "http://baconipsum.com/api/?type=all-meat&start-with-lorem=1&paras="

rv = ""
data = urllib.urlopen(url + str(numParagraphs)).read().decode('utf-8-sig')
dA = json.loads(data)
first = True

for x in dA:
    if(first == True):
        first = False;
    else:
        rv += "\n\n"
    rv += x;

sys.stdout.write(rv)
