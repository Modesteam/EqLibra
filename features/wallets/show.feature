Feature: Wallet Exibition
  In order to show my wallet
  As an user
  I should be able to show a wallet
    
  Scenario: Wallet Exibition
    Given I am an user
    And I am signed in
    And I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose the new wallet option
    When I fill in "wallet_name" with "Carteira Legal"
    When I fill in "wallet_comments" with "Carteira Incrível"
    When I press the "Enviar" button
    Then I should see "Wallet was successfully created."
    When I am at the homepage
    When I choose the wallets option
    Then I should see "Carteiras de Investimento"
    When I choose show option
    Then I should see "Descrição: Carteira Incrível"