// take a twitter url from the clipboard and replace the protocol with tweetbot://

var result = TextExpander.pasteboardText.replace(/http(s)?:\/\/((.|\n)*)twitter(.|\n)com\//g, "tweetbot://");

TextExpander.appendOutput(result);
