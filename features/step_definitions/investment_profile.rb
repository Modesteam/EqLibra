Given(/^I am at the homepage$/) do
  visit root_path
end

When(/^I choose the profile investment option$/) do
   click_link "Análise de Perfil de Investimento"
end

Then(/^I should see "(.+)"$/) do |text|
  expect(page).to have_content(text)
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