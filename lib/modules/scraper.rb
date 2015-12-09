# require 'nokogiri'
# require 'open-uri'
# require 'pry'



module Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("http://www.theskimm.com/recent"))
    h = {}
    doc.xpath('//a[@href]').each do |link|   
    h[link.text.strip] = link['href'] if link['href'] =~ /http:\/\/skimmth.is\//
  end
  puts h
  end
  binding.pry
end

Scraper.new.get_page