Feature: Investment Fund Creation
  In order to register my investment fund
  As an user
  I should be able to create an investment fund
    
  Scenario: Investment fund creation
    Given I am an user
    And I am signed in
    And I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose investment fund option
    Then I should see "Listing Investment Funds"
    When I choose the new investment fund option
    Then I should see "New Investment Fund"
    And I fill in "investment_fund_name" with "Meu Fundo BB de Investimento"
	  And I select date "2015 June 29" as the "investment_fund_buyDate"
    And I fill in "investment_fund_wallet_id" with "1"
    When I press the "Create Investment fund" button
    Then I should see "Nome: Meu Fundo BB de Investimento"
    And I should see "Data da Compra: 2015-06-29"
    And I should see "Investment fund was successfully created."