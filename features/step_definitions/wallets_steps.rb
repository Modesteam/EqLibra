And(/^I have a Wallet$/) do
  @wallet = FactoryGirl.create(:wallet)
end

And(/^I am on the my wallets$/) do
  visit wallets_path
end