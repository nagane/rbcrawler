require 'nokogiri'
require 'open-uri'

html = open( "http://www.amazon.co.jp/gp/bestsellers/")

doc = Nokogiri.HTML(html, nil, "UTF-8")

puts doc.xpath('//title').text
