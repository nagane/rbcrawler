require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

title = doc.xpath('/htlm/head/title')
title = doc.css('title')
object = doc.xpath('//a')

puts title
puts object
