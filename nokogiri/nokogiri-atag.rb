require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.yahoo.co.jp'))

nodesets = doc.xpath('//a')

puts nodesets.text

nodesets.each do |nodeset|
  puts nodeset.text
end
