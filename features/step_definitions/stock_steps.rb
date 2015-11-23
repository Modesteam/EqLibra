When(/^I choose stock option$/) do
   click_link "Bolsa de Valores"
end

When(/^I choose new stock option$/) do
   click_link "New Stock"
end

And /^(?:|I )select datetime "([^ ]*) ([^ ]*) ([^ ]*) - ([^:]*):([^"]*)" as the "([^"]*)"$/ do |year, month, day, hour, minute, field|
  select(year,   :from => "#{field}_1i")
  select(month,  :from => "#{field}_2i")
  select(day,    :from => "#{field}_3i")
  select(hour,   :from => "#{field}_4i")
  select(minute, :from => "#{field}_5i")
end