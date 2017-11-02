require 'nokogiri'

require 'open-uri'

url = "http://feeds.feedburner.com/hatena/b/hotentry"

xml = open(url).read

doc = Nokogiri::XML(xml)

namespace = {

  "rss" => "http://purl.org/rss/1.0/",
  "rdf" => "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
  "content" => "http://purl.org/rss/1.0/modules/content/",
  "dc" => "http://purl.org/dc/elements/1.1",
  "feedburner" => "http://rssnamespace.org/feedburner/ext/1.0"

}

# channel

channel = doc.xpath('//rss:channel', namespace)

# Xpath で title検索

puts channel.xpath('rss:title' , namespace)
puts channel.xpath('feedburner:info', namespace)
lis = channel.xpath('//rdf:li', namespace)

lis.each { |li|
  puts li.attribute("resource")
}

puts doc.css('channel title')

items = doc.xpath('//rss:item', namespace)
items.each { |item|
  puts item.xpath('rss:title', namespace).inner_text
  puts item.xpath('content:encoded', namespace)
  puts item.xpath('dc:date', namespace).inner_text

}
