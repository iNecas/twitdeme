Given /^user "([^\"]*)"$/ do |login|
  User.create(:username => login, :password => "password", :password_confirmation => "password")
end