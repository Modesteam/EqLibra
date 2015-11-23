When(/^I choose investment fund option$/) do
   click('Fundos de Inv.')
end

When(/^I choose the new investment fund option$/) do
   click_link "New Investment Fund"
end

When(/^I choose the wallets option$/) do
   click_link "Carteiras"
end

And /^(?:|I )select date "([^ ]*) ([^ ]*) ([^ ]*)" as the "([^"]*)"$/ do |year, month, day, field|
  select(year,   :from => "#{field}_1i")
  select(month,  :from => "#{field}_2i")
  select(day,    :from => "#{field}_3i")
end