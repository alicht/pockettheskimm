require 'nokogiri'
require 'open-uri'

module Business
  class Scraper
    def self.get_page
      doc = Nokogiri::HTML(open("http://www.theskimm.com/recent"))
      h = {}
      doc.xpath('//a[@href]').each do |link|   
       h[link.text.strip] = link['href'] if link['href'] =~ /http:\/\/skimmth.is\//
      end
      puts h

      h
    end

    def self.get_urls
      self.get_page.values
    end
  end
end