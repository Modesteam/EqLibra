Feature: Investment Fund Exibition
  In order to show my investment fund
  As an user
  I should be able to see an investment fund

  Scenario: Investment fund exibition
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
    When I choose investment fund option
    Then I should see "Fundo de Investimento"
    When I choose the new investment fund option
    Then I should see "Novo Fundo de Investimento"
    When I fill in "investment_fund_name" with "Meu Fundo BB de Investimento"
	And I select date "2015 June 29" as the "investment_fund_buyDate"
    When I fill in "Taxa Administrativa" with "5"
    When I fill in "Patrimônio Inicial" with "500000"
    When I fill in "Investimento" with "2000"
    When I fill in "Cotas Iniciais" with "100000"
    When I fill in "Carteira" with "1"
    When I press the "Enviar" button
    Then I should see "Investment fund was successfully created."
    When I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose investment fund option
    Then I should see "Fundo de Investimento"
    When I choose show option
    Then I should see "Percentual de Rentabilidade: 5%"