desc "Fetch title img from links"
task :fetch_title => :environment do


    require 'nokogiri'
	require 'open-uri'

	url = "https://www.elpais.com"
	doc = Nokogiri::HTML(open(url))
	puts doc.at_css("p").text
	doc.css(".item").each do |item|
	  title = item.at_css(".product-title-link span").text
	  price = item.at_css(".price-main .Price-group").text[/\$[0-9\.]+/]
	  puts "#{title} - #{price}"
	  puts item.at_css(".product-title-link span")[:href]

	end
end