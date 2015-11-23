Feature: Stock exibition
  In order to show my stock
  As an user
  I should be able to show a stock

  Scenario: Stock exibition
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
    And I fill in "Valor do Invest. Inicial" with "1000"
    And I fill in "Valor Atual" with "1400"
    And I fill in "Taxa de Compra" with "5"
    And I fill in "Quantidade" with "1"
    And I select datetime "2015 June 29 - 20:00" as the "stock_buy_date"
    And I fill in "Carteira" with "1"
    When I press the "Enviar" button
    Then I should see "Stock was successfully created."
    When I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose stock option
    Then I should see "Bolsa de Valores"
    When I choose show option
    Then I should see "Carteira: 1"
    When I choose movimentation option
    Then I should see "Receita Bruta: 400.0 R$"