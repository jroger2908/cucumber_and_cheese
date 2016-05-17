class LoginPage
  include PageObject

  page_url "http://mysite.com/login"
  text_field(:username, :id => "user_id")
  text_field(:password, :id => "user_password")
  button(:login, :value => "Login")

  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end
end