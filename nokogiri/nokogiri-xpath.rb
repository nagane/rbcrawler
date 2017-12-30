require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://hatena.ne.jp/'))

puts doc.xpath("/html/head/title")

puts doc.xpath("//title")

puts doc.xpath("//ul[@id='servicelist']/li[3]")

puts doc.xpath("//h2[@class='title']")

