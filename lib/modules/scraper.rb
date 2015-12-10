require 'open-uri'

module Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("http://www.theskimm.com/recent"))
    h = {}
    doc.xpath('//a[@href]').each do |link|   
     h[link.text.strip] = link['href'] if link['href'] =~ /http:\/\/skimmth.is\//
    end
    puts h
  end

  def get_urls
    get_page.values
  end
  # binding.pry
end