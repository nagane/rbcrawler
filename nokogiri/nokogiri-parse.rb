require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://yahoo.co.jp'))

p doc
