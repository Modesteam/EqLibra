Feature: Exchange Exibition
  In order to show my exchange
  As an user
  I should be able to show a exchange

  Scenario: Exchange exibition
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
    When I choose exchange option
    Then I should see "Câmbios"
    When I choose new exchange option
    And I fill in "Nome" with "Teste"
    And I fill in "Valor de compra da moeda:" with "45"
    And I fill in "Carteira" with "1"
    When I press the "Enviar" button
    Then I should see "Exchange was successfully updated."
    When I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose exchange option
    Then I should see "Câmbios"
    When I choose show option
    Then I should see "Valor líquido atual em Reais: 167.859"