require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

puts doc.at('//title').to_s
puts doc.at('//title').text
puts doc.at('//a').attribute('href')
puts doc.xpath('//title').to_s
puts doc.xpath('//title').text
