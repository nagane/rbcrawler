require 'anemone'
require 'nokogiri'
require 'kconv'


urls = []

urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466282/ref=zg_bs_nav_b_1_b/357-0338539-0422736")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466298/ref=zg_bs_nav_b_1_b/357-0338539-0422736")
urls.push("https://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/ref=zg_bs_nav_kinc_2_2275256051/355-1037402-6063834")
urls.push("https://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/ref=zg_bs_nav_kinc_2_2275256051/355-1037402-6063834")

Anemone.crawl(urls, :depth_limit => 0) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text

    sub_category = doc.xpath("//*[@id=\"zg_listTitle\"]/span").text

    puts category + "/" + sub_category
    
  end
end
