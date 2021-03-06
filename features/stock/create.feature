Feature: Stock Creation
  In order to register my stock
  As an user
  I should be able to create a stock

  Scenario: Investment fund creation
    Given I am an user
    And I am signed in
    And I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose the new wallet option
    When I fill in "wallet_name" with "Carteira Legal"
    When I fill in "wallet_comments" with "Carteira Incrível"
    When I press the "Enviar" button
    When I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose stock option
    Then I should see "Bolsa de Valores"
    When I choose new stock option
    And I fill in "stock_name" with "Stock 1"
    And I select datetime "2015 June 29 - 20:00" as the "stock_buy_date"
    And I fill in "Carteira" with "1"
    When I press the "Enviar" button
    Then I should see "Stock was successfully created."