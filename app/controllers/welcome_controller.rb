class WelcomeController < ApplicationController
  def index
  end

  def connect
      puts "OAUTH CONNECT"
    session[:code] = Pocket.get_code(:redirect_uri => 'http://localhost:3000/auth/pocket/callback')
    new_url = Pocket.authorize_url(:code => session[:code], :redirect_uri => 'http://localhost:3000/auth/pocket/callback')
    puts "new_url: #{new_url}"
    puts "session: #{session}"
    redirect_to new_url
  end

  def callback
      puts "OAUTH CALLBACK"
  puts "request.url: #{request.url}"
  puts "request.body: #{request.body.read}"
  result = Pocket.get_result(session[:code], :redirect_uri => 'http://localhost:3000/auth/pocket/callback')
  session[:access_token] = result['access_token']
  puts result['access_token']
  puts result['username'] 
  # Alternative method to get the access token directly
  #session[:access_token] = Pocket.get_access_token(session[:code])
  puts session[:access_token]
  puts "session: #{session}"
  redirect_to root_path
  end

  def add 

  client = Pocket.client(:access_token => session[:access_token])
  info = client.add :url => 'http://getpocket.com'
  puts "<pre>#{info}</pre>"
  end

end

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