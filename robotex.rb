require 'robotex'

robo = Robotex.new
  "test"

p robo.allowed?("http://www.yahoo.co.jp")
p robo.allowed?("https://www.facebook.com/")
