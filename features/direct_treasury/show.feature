Feature: Direct Treasury Exibition
  In order to show my direct treasury
  As an user
  I should be able to show a direct treasury

  Scenario: Direct Treasury exibition
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
    When I choose direct treasury option
    Then I should see "Tesouro Direto"
    When I choose new direct treasury option
    And I fill in "Nome" with "Teste"
    And I select date "2015 November 23" as the "direct_treasury_buyDate"
    And I select date "2017 April 4" as the "direct_treasury_dueDate"
    When I fill in "Valor de Investimento" with "1000"
    When I fill in "Taxa de Aquisição" with "15"
    When I fill in "Taxa Administrativa" with "5"
    When I fill in "Carteira" with "1"
    When I press the "Enviar" button
    Then I should see "Direct treasury was successfully created."
    When I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose direct treasury option
    When I choose show option
    Then I should see "Rendimento Líquido: 18.01%"