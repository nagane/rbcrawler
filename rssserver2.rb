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
    dates = page_source.scan(
      %r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)
    url_titles = page_source.scan(
      %r!^<a href="(.+?)">(.+?)</a><br />!)
    url_titles.zip(dates).map{|(aurl, atitle),
      ymd|[GGI.unescapeHTML(aurl),
      CGI.unescapeHTML(atitle), Time.local(*ymd)] 
    }
  end
end

class Formatter

  def initialize(site)
    @url = site.url
    @title = site.title
  end
  attr_reader :url, :title

end

class TextFormatter < Formatter
  def format(url_title_time_day)

  end
end
