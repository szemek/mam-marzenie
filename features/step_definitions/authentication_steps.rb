Given(/^I am not authenticated$/) do
  # visit('/')
  # visit('/users/logout')
  page.driver.submit :delete, path_to('logout'), {}
end

When(/^I go to (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I fill in '(.+)' with "(.*?)"$/) do |name, value|
  fill_in name, with: value
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

When(/^I fill out the form with the following attributes:$/) do |table|
  table.rows_hash.each do |field, value|
    fill_in field.to_sym, with: value
  end
end

Given(/^I am a new, authenticated user$/) do
  fullname, email, password = 'Foo Bar', 'test@example.com', 'secret'
  region = 'lorem'
  User.new(
    fullname: fullname,
    email: email,
    region: region,
    password: password,
    password_confirmation: password
  ).save!
  visit path_to('login')
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'Sign in'
end

When(/^I want to edit my profile$/) do
  visit path_to('my profile')
end
