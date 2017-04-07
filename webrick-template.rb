#!/usr/bin/ruby

require 'webrick'

class TestContentServlet < 
  WEBrick::HTTPServlet::AbstractServlet

  def do_GET(req,res)
    res.body = "this is #{req.path}<br>"
    res.content_type = WEBrick::HTTPUtils.mine_type(
      req.path_info,
      WEBrick::HTTPUtils::DefaultMineTypes
    )
  end
end

srv = WEBrick::HTTPServer.new(
  :BindAddress => '127.0.0.1', :Port => 7777)

srv.mount
