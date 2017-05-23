require 'cgi'
require 'open-uri'
require 'rss'
require 'kconv'

class Site

  def initialize(url:"", title:"")
    @url , @title = url , title
  end

  attr_reader :url , :title

  def page_source
    @page_source ||= open(@url , &:read).toutf8
  end

  def output(formatter_class)
    formatter_class.new(self).format(parse)
  end
end

class SbcrTopics < Site
  def parse

  end
end
