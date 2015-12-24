class WelcomeController < ApplicationController
  def index; end

  def add
    client = Pocket.client(access_token: session[:access_token])

    Business::Scraper.new.get_urls.each do |url|
      info = client.add url: url
      client.modify [{action: "tags_add", item_id: info["item"]["item_id"], tags: "pockettheSkimm", time: Time.now.to_i}]
    end

    render :thanks
  end

  def thanks; end

  def destroy
    session[:access_token] = nil
    render :index
  end

end

# {"item"=>
#   {"item_id"=>"1128815980",
#    "normal_url"=>"http://skimmth.is/1QukjAg",
#    "resolved_id"=>"1127678606",
#    "extended_item_id"=>"1127678606",
#    "resolved_url"=>
#     "http://www.cbsnews.com/news/how-to-watch-victorias-secret-fashion-show-2015/",
#    "domain_id"=>"1979",
#    "origin_domain_id"=>"22436853",
#    "response_code"=>"200",
#    "mime_type"=>"text/html",
#    "content_length"=>"18774",
#    "encoding"=>"utf-8",
#    "date_resolved"=>"2015-12-09 14:15:52",
#    "date_published"=>"2015-12-09 13:24:00",
#    "title"=>"How to watch the Victoria's Secret Fashion Show",
#    "excerpt"=>
#     "Miss the show? You can still watch it here, or check out some highlights via this playlist:  Want to tune into see the Victoria's Secret Fashion Show tonight? We don't blame you -- what's not to love about dozens of stunning models, star musicians and a $2 million bra?",
#    "word_count"=>"173"

# get "/oauth/connect" do
#   puts "OAUTH CONNECT"
#   session[:code] = Pocket.get_code(:redirect_uri => CALLBACK_URL)
#   new_url = Pocket.authorize_url(:code => session[:code], :redirect_uri => CALLBACK_URL)
#   puts "new_url: #{new_url}"
#   puts "session: #{session}"
#   redirect new_url
# end

# get "/oauth/callback" do
#   puts "OAUTH CALLBACK"
#   puts "request.url: #{request.url}"
#   puts "request.body: #{request.body.read}"
#   result = Pocket.get_result(session[:code], :redirect_uri => CALLBACK_URL)
#   session[:access_token] = result['access_token']
#   puts result['access_token']
#   puts result['username']
#   # Alternative method to get the access token directly
#   #session[:access_token] = Pocket.get_access_token(session[:code])
#   puts session[:access_token]
#   puts "session: #{session}"
#   redirect "/"
# end
