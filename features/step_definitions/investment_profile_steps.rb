Given(/^I am at the homepage$/) do
  visit root_path
end

Given(/^I am an user$/) do
  @user = FactoryGirl.create(:user)
end

Given(/^I am signed in$/) do
  login_as(@user, :scope => :user)
end


Then(/^I should see "(.+)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I choose the my profile option$/) do
   click_link "Meu Perfil"
end

When(/^I choose the answer questionnaire option$/) do
   click_link "Responder Questionário"
end

When(/^I fill in "(.+)" with "(.+)"$/) do |field, text|
  fill_in field, :with => text
end

When(/^I press the "(.+)" button$/) do |text|
  click_button text
end

When(/^I choose the show investment profile probabilities option$/) do
   click_link "Visualizar Probabilidades dos Perfis de Investimento"
end
