require "test_helper"

module Business
  class ScraperTest < ActiveSupport::TestCase
    def test_get_urls
      VCR.use_cassette("get_page") do
        urls = Scraper.new.get_urls
        assert urls.all? { |url| url =~ Scraper::LINK_REGEX }
      end
    end
  end
end
