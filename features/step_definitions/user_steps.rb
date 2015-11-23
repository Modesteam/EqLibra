When(/^I click on Sign up link$/) do
  visit new_user_registration_path
end

When(/^I click on Logout link$/) do
  click_link "Log out"
end
