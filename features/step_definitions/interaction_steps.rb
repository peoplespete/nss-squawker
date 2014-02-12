And "show me the page" do
  save_and_open_page
end

Given(/^the squeek "(.*?)"$/) do |body|
  Squeek.create(body: body)
end

Given(/^I am on the sign in page$/) do
  visit new_user_session_path
end

When(/^I go to the homepage$/) do
  visit root_path
end

When(/^I (?:click|follow) "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

Then(/^I should see(?::)? "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |content, field|
  fill_in(field, with: content)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in(field, with: content)
end

Then(/^I should see "(.*?)" within the squeeks feed$/) do |text|
  within(".squeeks") do
    page.should have_content(text)
  end
end

Then(/^there should be a squeek "(.*?)" in the database$/) do |text|
  squeek_count = Squeek.where(body: text).count
  # Equivalent to: assert_equal 1, squeek_count
  squeek_count.should == 1
end

Given(/^the user "(.*?)"\/"(.*?)" with "(.*?)"$/) do |username, email, password|
  User.create(username: username, email: email, password: password, password_confirmation: password)
end