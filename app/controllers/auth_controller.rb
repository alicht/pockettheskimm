class AuthController < ApplicationController
  REDIRECT_URI = "http://www.pockettheskimm.com/auth/pocket/callback"

  def show
    session[:code] = Pocket.get_code(redirect_uri: REDIRECT_URI)

    auth_url = Pocket.authorize_url(
      code: session[:code],
      redirect_uri: REDIRECT_URI
    )

    redirect_to auth_url
  end

  def create
    result = Pocket.get_result(session[:code], redirect_uri: REDIRECT_URI)
    session[:access_token] = result["access_token"]
    redirect_to root_path
  end
end
