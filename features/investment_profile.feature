Feature: Investment Profile
	In order to check my investment profile
    As an user
  	I should be able to verify my investment profile
	
	Scenario: Should appears the correct investment profile analysis
	    Given I am an user
	    And I am signed in
	    And I am at the homepage
	    Then I should see "Seja bem Vindo!"
	    When I choose the my profile option
	    Then I should see "Questionário de Verificação de Perfil de Investidor"
	    When I choose the answer questionnaire option
	    Then I should see "Entre com as informações nos campos de texto abaixo"
	    When I fill in "risk" with "Baixo"
	    When I fill in "availability" with "Curto"
	    When I fill in "profitability" with "Baixo"
	    When I press the "Submeter" button
	    Then I should see "Atributos informados no Questionário"
	    Then I should see "Apetência ao Risco: Baixo"
	    Then I should see "Disponibilidade por Aplicação: Curto"
	    Then I should see "Nível de oscilação de Rendibilidade: Baixo"
	    When I choose the show investment profile probabilities option
	    Then I should see "Probabilidades de Perfis de Investimento"
	    Then I should see "Conservador: 0.143"
	    Then I should see "Moderado: 0.0"
	    Then I should see "Dinâmico: 0.0"
	    Then I should see "Arrojado: 0.0"
	    Then I should see "O perfil que possui a maior probabilidade é o seu perfil de investidor."