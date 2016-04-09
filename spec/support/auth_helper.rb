module AuthHelper

  def http_login(user = FactoryGirl.create(:user))
    username = user.name
    pw = user.password_digest
    raise "Invalid password for #http_login" if pw.empty?
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username,pw)
  end
end
