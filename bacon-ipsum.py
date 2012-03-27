#!/usr/bin/python

import sys
import urllib
import json

numParagraphs = 2
url = "http://baconipsum.com/api/?type=all-meat&start-with-lorem=1&paras="

rv = ""
data = urllib.urlopen(url + str(numParagraphs)).read().decode('utf-8-sig')
dA = json.loads(data)

for x in dA:
    rv += x;
    rv += "\n"

sys.stdout.write(rv)
