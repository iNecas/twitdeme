Given /^user "([^\"]*)"$/ do |login|
  User.create(:username => login, :password => "password")
end