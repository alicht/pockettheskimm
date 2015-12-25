module Business
  class Scraper

    RECENT_URL = "http://www.theskimm.com/recent"
    LINK_REGEX = /http:\/\/skimmth.is\//

    def initialize
      @page = Nokogiri::HTML(open(RECENT_URL))
    end

    def get_urls
      links_hash = {}
      @page.xpath("//a[@href]").each do |link|
        links_hash[link.text.strip] = link["href"] if link["href"] =~ LINK_REGEX
      end
      links_hash.values
    end
  end
end
