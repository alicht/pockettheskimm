require "test_helper"

module Pocket
  module_function

  CODE     = "Some code"
  TOKEN    = "Some token"
  AUTH_URL = "/auth/url"

  def get_result(code, options = {})
    { "access_token" => TOKEN }
  end

  def get_code(options = {})
    CODE
  end

  def authorize_url(options = {})
    AUTH_URL
  end
end

class AuthControllerTest < ActionController::TestCase
  def test_show_redirects_to_pocket_auth_url
    get :show
    assert_redirected_to Pocket::AUTH_URL
  end

  def test_show_stores_pocket_code_in_session
    get :show
    assert_equal Pocket::CODE, session[:code]
  end

  def test_create_redirects_to_root_path
    session[:code] = Pocket::CODE
    post :create
    assert_redirected_to root_path
  end

  def test_create_stores_access_token_in_session
    session[:code] = Pocket::CODE
    post :create
    assert_equal Pocket::TOKEN, session[:access_token]
  end
end
