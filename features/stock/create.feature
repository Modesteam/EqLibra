Feature: Stock Creation
  In order to register my stock
  As an user
  I should be able to create a stock

  Scenario: Investment fund creation
    Given I am an user
    And I am signed in
    And I am at the homepage
    When I choose the wallets option
    Then I should see "Listing Wallets"
    When I choose the new wallet option
    When I fill in "wallet_name" with "Carteira Legal"
    When I fill in "wallet_comments" with "Carteira Incrível"
    When I press the "Create Wallet" button
    When I am at the homepage
    When I choose the wallets option
    Then I should see "Listing Wallets"
    When I choose stock option
    Then I should see "Listing Stocks"
    When I choose new stock option
    And I fill in "stock_name" with "Stock 1"
    And I fill in "Initial income" with "100"
    And I fill in "Current income" with "150"
    And I select datetime "2015 June 29 - 20:00" as the "stock_buy_date"
    And I fill in "Wallet" with "1"
    When I press the "Create Stock" button
    Then I should see "Stock was successfully created."